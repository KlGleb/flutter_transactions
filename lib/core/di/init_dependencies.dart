import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/data/auth_repository_impl.dart';
import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/data_sources/transactions_data_source_impl.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/db/database.dart';
import 'package:transactions/core/data/transaction_repository_impl.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/epics.dart';
import 'package:transactions/core/redux/middlewares.dart';
import 'package:transactions/core/redux/reducers.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerLazySingleton<Store<AppState>>(
    () => Store<AppState>(
      reducer,
      initialState: AppState(Unauthorized(true)),
      middleware: [
        ...createAuthMiddleware(getIt()),
        ...createTransactionsMiddleware(getIt()),
        ...createTransactionDetailsMiddleware(getIt()),
        epicMiddleware,
      ],
    ),
  );
  getIt.registerSingleton(AppDatabase());
  getIt.registerLazySingleton(() => TransactionsDao(getIt()));
  getIt.registerSingleton<TransactionDataSource>(TransactionDataSourceImpl());
  getIt.registerSingleton<TransactionRepository>(TransactionRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton(() => Logger());
}
