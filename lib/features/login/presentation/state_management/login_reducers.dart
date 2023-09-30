import 'package:redux/redux.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, Login>(_loginReducer),
  TypedReducer<AuthState, Logout>(_logoutReducer),
  TypedReducer<AuthState, LoginSuccess>(_loginSuccessReducer),
  TypedReducer<AuthState, LogoutSuccess>(_logoutSuccessReducer),
]);

AuthState _loginReducer(AuthState state, Login action) => Authorized(true);

AuthState _logoutReducer(AuthState state, Logout action) => Unauthorized(true);

AuthState _loginSuccessReducer(AuthState state, LoginSuccess action) => Authorized(false);

AuthState _logoutSuccessReducer(AuthState state, LogoutSuccess action) => Unauthorized(false);
