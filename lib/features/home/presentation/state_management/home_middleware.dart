import 'package:redux/redux.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';

List<Middleware<AppState>> createHomeMiddleware(
  AuthRepository authRepository,
  TransactionRepository transactionRepository,
) =>
    [
      TypedMiddleware<AppState, Logout>(_createLogout(authRepository)),
      TypedMiddleware<AppState, SyncTransactions>(_createGetTransactions(transactionRepository)),
    ];

Middleware<AppState> _createLogout(AuthRepository repository) => (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.logOut().then((value) => store.dispatch(LoggedOut()));
    };

Middleware<AppState> _createGetTransactions(TransactionRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.sync().then((_) => store.dispatch(SyncCompleted()));
    };
