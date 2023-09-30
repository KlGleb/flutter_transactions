import 'package:redux/redux.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';

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
