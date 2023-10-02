import 'package:redux/redux.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/exceptions/auth_exception.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';

List<Middleware<AppState>> createLoginMiddleware(AuthRepository repository) => [
      TypedMiddleware<AppState, Login>(_createLogin(repository)),
    ];

Middleware<AppState> _createLogin(AuthRepository repository) => (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      final state = store.state.loginState;
      repository
          .logIn(state.userName!, state.password!)
          .then((_) => store.dispatch(LoggedIn()))
          .onError<WrongCredentialsException>((_, __) => store.dispatch(WrongCredentialsError()))
          .onError((_, __) => store.dispatch(LoggedInError()));
    };
