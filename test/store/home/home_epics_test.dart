import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/home/presentation/state_management/home_epics.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';

import '../../util/mock_sources.dart';
import '../mock.dart';

void main() {
  group('home epics tests', () {
    late MockTransactionRepository repository;
    late MockStore store;
    late TestNextDispatcher nextDispatcher;

    setUp(() {
      nextDispatcher = TestNextDispatcher();
      repository = MockTransactionRepository();
      store = MockStore();
    });

    test('SubscribeCountEpic should subscribe to a transactions count on SubscribeToCount event', () async {
      const count = [1, 2, 3];
      when(repository.count).thenAnswer((_) => Stream.fromIterable(count));
      final epic = SubscribeCountEpic(repository);
      final middleware = EpicMiddleware<AppState>(epic);

      middleware(store, SubscribeToCount(), nextDispatcher.nextDispatcher);

      await Future.delayed(const Duration(milliseconds: 50));

      expect(nextDispatcher.called, true);
      verify(repository.count);
      for (var element in count) {
        verify(
          store.dispatch(
            isA<TransactionsCountUpdated>().having((p0) => p0.count, 'Event should contain $element', element),
          ),
        ).called(1);
      }
    });

    test('SubscribeTransactionsEpic should subscribe to  transactions on SubscribeToTransactions event', () async {
      when(repository.transactions).thenAnswer((_) => Stream.fromIterable([mockTransactions, mockTransactions2]));
      final epic = SubscribeTransactionsEpic(repository);
      final middleware = EpicMiddleware<AppState>(epic);

      middleware(store, SubscribeToTransactions(), nextDispatcher.nextDispatcher);

      await Future.delayed(const Duration(milliseconds: 50));

      expect(nextDispatcher.called, true);
      verify(repository.transactions);
      for (var element in [mockTransactions, mockTransactions2]) {
        verify(
          store.dispatch(
            isA<TransactionsUpdated>().having((p0) => p0.transactions, 'Event should contain $element', element),
          ),
        ).called(1);
      }
    });
  });
}
