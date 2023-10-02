import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_reducers.dart';
import 'package:transactions/features/login/presentation/state_management/login_state.dart';

void main() {
  late Reducer<LoginState> reducer;

  const someState = LoginState(
    inProgress: false,
    wrongCredentialsError: true,
    unknownError: true,
    userName: 'some user name',
    password: 'some password',
  );

  setUp(() => reducer = loginReducer);

  group('loginReducer tests', () {
    test('Login action should change the state with progress and no errors', () {
      expect(
        reducer(someState, Login()),
        someState.copyWith(inProgress: true, wrongCredentialsError: false, unknownError: false),
      );
    });

    test('LoggedIn action should clear the state', () {
      expect(
        reducer(someState, LoggedIn()),
        const LoginState(),
      );
    });

    test('SaveUserName action should update state.userName', () {
      expect(reducer(const LoginState(), SaveUserName('userName')), const LoginState(userName: 'userName'));
    });

    test('SavePassword action should update state.password', () {
      expect(reducer(const LoginState(), SavePassword('password')), const LoginState(password: 'password'));
    });

    test('LoggedInError action should update state.inProgress, state.unknownError', () {
      expect(
        reducer(const LoginState(unknownError: false, inProgress: true), LoggedInError()),
        const LoginState(unknownError: true, inProgress: false),
      );
    });

    test('WrongCredentialsError action should update state.inProgress, state.unknownError', () {
      expect(
        reducer(const LoginState(unknownError: false, inProgress: true), WrongCredentialsError()),
        const LoginState(wrongCredentialsError: true, inProgress: false),
      );
    });
  });
}
