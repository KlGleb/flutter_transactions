import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/exceptions/auth_exception.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_middleware.dart';
import 'package:transactions/features/login/presentation/state_management/login_state.dart';

import '../mock.dart';
import '../util.dart';

void main() {
  group('loginMiddleware tests', () {
    late List<Middleware<AppState>> middleware;
    late MockAuthRepository authRepository;
    late MockStore store;
    late TestNextDispatcher nextDispatcher;

    setUp(() {
      authRepository = MockAuthRepository();
      store = MockStore();
      nextDispatcher = TestNextDispatcher();
      when(store.state).thenReturn(const AppState(loginState: LoginState(userName: 'userName', password: 'password')));
      middleware = createLoginMiddleware(authRepository);
    });

    test('Login event should produce a repository.logIn() call and LoggedIn() event', () async {
      middleware.act(store, Login(), nextDispatcher.nextDispatcher);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(nextDispatcher.called, true);
      verify(authRepository.logIn('userName', 'password'));
      verify(store.dispatch(isA<LoggedIn>()));
    });

    test(
      'Login event should produce a repository.logIn() call and WrongCredentialsError() event if the repository '
      'throws WrongCredentialsException',
      () async {
        when(authRepository.logIn(any, any)).thenAnswer((_) => Future.error(WrongCredentialsException()));
        middleware.act(store, Login(), nextDispatcher.nextDispatcher);
        await Future.delayed(const Duration(milliseconds: 50));
        expect(nextDispatcher.called, true);
        verify(authRepository.logIn('userName', 'password'));
        verify(store.dispatch(isA<WrongCredentialsError>()));
      },
    );

    test(
      'Login event should produce a repository.logIn() call and LoggedInError() event if the repository '
      'throws any exception but WrongCredentialsException',
      () async {
        when(authRepository.logIn(any, any)).thenAnswer((_) => Future.error(Exception()));
        middleware.act(store, Login(), nextDispatcher.nextDispatcher);
        await Future.delayed(const Duration(milliseconds: 50));
        expect(nextDispatcher.called, true);
        verify(authRepository.logIn('userName', 'password'));
        verify(store.dispatch(isA<LoggedInError>()));
      },
    );
  });
}
