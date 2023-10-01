import 'package:redux/redux.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/core/redux/auth/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, LoggedIn>(_loginReducer),
  TypedReducer<AuthState, LoggedOut>(_logoutReducer),
]);

AuthState _loginReducer(AuthState state, LoggedIn action) => AuthState.authorized;

AuthState _logoutReducer(AuthState state, LoggedOut action) => AuthState.unauthorized;
