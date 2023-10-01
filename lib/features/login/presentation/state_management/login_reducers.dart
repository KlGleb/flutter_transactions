import 'package:redux/redux.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_state.dart';

Reducer<LoginState> loginReducer = combineReducers([
  TypedReducer<LoginState, Login>(_loginReducer),
  TypedReducer<LoginState, LoggedIn>(_loggedInReducer),
  TypedReducer<LoginState, SaveUserName>(_enterUserNameReducer),
  TypedReducer<LoginState, SavePassword>(_enterPasswordNameReducer),
  TypedReducer<LoginState, LoggedInError>(_loggedInErrorReducer),
  TypedReducer<LoginState, WrongCredentialsError>(_wrongCredentialsErrorReducer),
]);

LoginState _loginReducer(LoginState state, Login action) => state.copyWith(
      inProgress: true,
      wrongCredentialsError: false,
      unknownError: false,
    );

LoginState _loggedInReducer(LoginState state, LoggedIn action) => const LoginState();

LoginState _enterUserNameReducer(LoginState state, SaveUserName action) => state.copyWith(userName: action.userName);

LoginState _enterPasswordNameReducer(LoginState state, SavePassword action) =>
    state.copyWith(password: action.password);

LoginState _loggedInErrorReducer(LoginState state, LoggedInError action) =>
    state.copyWith(inProgress: false, unknownError: true);

LoginState _wrongCredentialsErrorReducer(LoginState state, WrongCredentialsError action) =>
    state.copyWith(inProgress: false, wrongCredentialsError: true);
