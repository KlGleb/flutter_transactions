import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_reducers.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_state.dart';

import '../../util/mock_sources.dart';

void main() {
  late Reducer<TransactionsState> reducer;

  setUp(() => reducer = transactionsReducer);

  group('transactionsReducer tests', () {
    test('TransactionsUpdated action should change the state with action.transactions', () {
      expect(
        reducer(const TransactionsState(), TransactionsUpdated(mockTransactions)),
        TransactionsState(transactions: mockTransactions),
      );
    });

    test('TransactionsCountUpdated action should change the state with action.count', () {
      expect(
        reducer(const TransactionsState(), TransactionsCountUpdated(5)),
        const TransactionsState(count: 5),
      );
    });

    test('SyncTransactions action should change the state with a progress', () {
      expect(
        reducer(const TransactionsState(), SyncTransactions()),
        const TransactionsState(synchronizing: true),
      );
    });

    test('SyncCompleted action should remove a progress from the state', () {
      expect(
        reducer(const TransactionsState(synchronizing: true), SyncCompleted()),
        const TransactionsState(synchronizing: false),
      );
    });
  });
}
