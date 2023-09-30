import 'package:redux_epics/redux_epics.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/home/presentation/state_management/home_epics.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_epics.dart';

final EpicMiddleware<AppState> epicMiddleware = EpicMiddleware(epic);

final epic = combineEpics<AppState>([
  SubscribeTransactionsEpic(getIt()),
  SubscribeCountEpic(getIt()),
  SubscribeTransactionEpic(getIt()),
]);
