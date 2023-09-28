import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/data/auth_repository_impl.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/middlewares.dart';
import 'package:transactions/core/redux/reducers.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerLazySingleton<Store<AppState>>(
        () =>
        Store<AppState>(
          reducer,
          initialState: AppState(Unauthorized(true)),
          middleware: [
            ...createAuthMiddleware(getIt<AuthRepository>()),
          ],
        ),
  );
}
