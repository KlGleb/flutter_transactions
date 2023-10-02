import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_middleware.dart';

import '../mock.dart';
import '../util.dart';

void main() {
  group('transactionDetailsMiddleware tests', () {
    late List<Middleware<AppState>> middleware;
    late MockTransactionRepository repository;
    late MockStore store;
    late TestNextDispatcher nextDispatcher;

    setUp(() {
      repository = MockTransactionRepository();
      store = MockStore();
      nextDispatcher = TestNextDispatcher();
      middleware = createTransactionDetailsMiddleware(repository);
    });

    test('RemoveTransaction event should produce a repository.remove() call and RemoveCompleted() event', () async {
      middleware.act(store, RemoveTransaction('some transaction id'), nextDispatcher.nextDispatcher);
      await Future.delayed(const Duration(milliseconds: 50));
      expect(nextDispatcher.called, true);
      verify(repository.remove('some transaction id'));
      verify(store.dispatch(isA<RemoveCompleted>()));
    });
  });
}
