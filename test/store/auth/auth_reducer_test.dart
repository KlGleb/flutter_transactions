import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/core/redux/auth/auth_reducers.dart';
import 'package:transactions/core/redux/auth/auth_state.dart';

void main() {
  group('authReducer tests', () {
    late Reducer<AuthState> reducer;
    setUp(() {
      reducer = authReducer;
    });

    test('LoggedIn event should make AuthState.authorized', () {
      expect(reducer(AuthState.unauthorized, LoggedIn()), AuthState.authorized);
    });

    test('LoggedOut event should make AuthState.unauthorized', () {
      expect(reducer(AuthState.authorized, LoggedOut()), AuthState.unauthorized);
    });
  });
}
