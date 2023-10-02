import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/home/presentation/state_management/home_middleware.dart';

import '../mock.dart';
import '../util.dart';

void main() {
  group('homeMiddleware tests', () {
    late List<Middleware<AppState>> middleware;
    late MockAuthRepository authRepository;
    late MockTransactionRepository transactionRepository;
    late MockStore store;
    late TestNextDispatcher nextDispatcher;

    setUp(() {
      authRepository = MockAuthRepository();
      transactionRepository = MockTransactionRepository();
      store = MockStore();
      nextDispatcher = TestNextDispatcher();
      middleware = createHomeMiddleware(authRepository, transactionRepository);
    });

    test('Logout event should produce a repository.logout() call and LoggedOut() event', () async {
      middleware.act(store, Logout(), nextDispatcher.nextDispatcher);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(nextDispatcher.called, true);
      verify(authRepository.logOut());
      verify(store.dispatch(isA<LoggedOut>()));
    });

    test('SyncTransactions event should produce a repository.sync() call and SyncCompleted event', () async {
      middleware.act(store, SyncTransactions(), nextDispatcher.nextDispatcher);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(nextDispatcher.called, true);
      verify(transactionRepository.sync());
      verify(store.dispatch(isA<SyncCompleted>()));
    });
  });
}
