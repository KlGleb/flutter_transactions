import 'package:redux_epics/redux_epics.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/home/presentation/state_management/home_epics.dart';

final EpicMiddleware<AppState> epicMiddleware = EpicMiddleware(epic);

final epic = combineEpics<AppState>([_subscribeEpic, _unsubscribeEpic, _subscribeTransactionEpic]);

final _subscribeEpic = TypedEpic<AppState, HomeAction>(SubscribeCountEpic(getIt()));
final _unsubscribeEpic = TypedEpic<AppState, HomeAction>(SubscribeTransactionsEpic(getIt()));
final _subscribeTransactionEpic = TypedEpic<AppState, HomeAction>(SubscribeTransactionsEpic(getIt()));
