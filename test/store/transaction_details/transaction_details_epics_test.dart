import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_epics.dart';

import '../../util/mock_sources.dart';
import '../mock.dart';

void main() {
  group('transactionDetails epics tests', () {
    late MockTransactionRepository repository;
    late MockStore store;
    late EpicClass<AppState> epic;
    late EpicMiddleware<AppState> middleware;
    late TestNextDispatcher nextDispatcher;

    const id = 'transaction id';

    final trs = [
      mockTransactions[0],
      mockTransactions[0].copyWith(amount: 12),
      mockTransactions[0].copyWith(amount: 456),
    ];

    setUp(() {
      nextDispatcher = TestNextDispatcher();
      repository = MockTransactionRepository();
      epic = SubscribeTransactionEpic(repository);
      middleware = EpicMiddleware<AppState>(epic);
      store = MockStore();
    });

    test('SubscribeTransactionEpic should subscribe to a transaction on SubscribeToTransaction event', () async {
      when(repository.watchById(id)).thenAnswer((_) => Stream.fromIterable(trs));
      middleware(store, SubscribeToTransaction(id), nextDispatcher.nextDispatcher);

      await Future.delayed(const Duration(milliseconds: 50));

      expect(nextDispatcher.called, true);
      verify(repository.watchById(id));
      for (var element in trs) {
        verify(
          store.dispatch(
            isA<TransactionDetailsUpdated>().having((p0) => p0.transaction, 'Event should contain $element', element),
          ),
        ).called(1);
      }
    });
  });
}
