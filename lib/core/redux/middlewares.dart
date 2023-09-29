import 'package:redux/redux.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';

List<Middleware<AppState>> createAuthMiddleware(AuthRepository repository) => [
      TypedMiddleware<AppState, Login>(_createLogin(repository)),
      TypedMiddleware<AppState, Logout>(_createLogout(repository)),
    ];

Middleware<AppState> _createLogout(AuthRepository repository) => (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.logOut().then((value) => store.dispatch(LogoutSuccess()));
    };

Middleware<AppState> _createLogin(AuthRepository repository) => (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.logIn(action.userName, action.password).then((_) => store.dispatch(LoginSuccess()));
    };

List<Middleware<AppState>> createTransactionsMiddleware(TransactionRepository repository) => [
      TypedMiddleware<AppState, GetTransactions>(_createGetTransactions(repository)),
      TypedMiddleware<AppState, TransactionsUpdated>(_createDonut())
    ];

Middleware<AppState> _createGetTransactions(TransactionRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.get();
    };

Middleware<AppState> _createDonut() => (Store<AppState> store, action, NextDispatcher next) {
      next(action);

      final DonutState map = {};
      for (final element in action.transactions) {
        if (map.containsKey(element.type)) {
          map[element.type] = map[element.type]! + 1;
        } else {
          map[element.type] = 1;
        }
      }

      store.dispatch(DonutUpdated(map));
    };
