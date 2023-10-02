import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_actions.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_middleware.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';

import '../../util/mock_sources.dart';
import '../mock.dart';
import '../util.dart';

void main() {
  group('donutMiddleware tests', () {
    late List<Middleware<AppState>> donutMiddleware;
    late MockTransactionRepository repository;
    late MockStore store;

    setUp(() {
      repository = MockTransactionRepository();
      store = MockStore();
      donutMiddleware = createDonutMiddleware(repository);
    });

    test('TransactionsUpdated event should make appropriate DonutState', () async {
      final nd = TestNextDispatcher();

      donutMiddleware.act(store, TransactionsUpdated(mockTransactions), nd.nextDispatcher);
      expect(nd.called, true);
      verify(
        store.dispatch(
          isA<DonutUpdated>().having(
            (p0) => p0.data,
            'Event data should contain appropriate value',
            {TransactionType.deposit: mockTransactions.length},
          ),
        ),
      );
    });
  });
}
