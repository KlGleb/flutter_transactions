import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_reducers.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_state.dart';

import '../../util/mock_sources.dart';

void main() {
  late Reducer<TransactionDetailsState> reducer;

  setUp(() => reducer = transactionDetailsReducer);

  group('transactionDetailsReducer tests', () {
    test('TransactionDetailsUpdated action should change the state with action.transactions', () {
      expect(
        reducer(const TransactionDetailsState(), TransactionDetailsUpdated(mockTransactions[0])),
        TransactionDetailsState(transaction: mockTransactions[0]),
      );
    });

    test('RemoveTransaction action should change the state with a progress', () {
      expect(
        reducer(const TransactionDetailsState(), RemoveTransaction(mockTransactions[0].id)),
        const TransactionDetailsState(removingInProgress: true),
      );
    });

    test('RemoveCompleted action should change the state with no progress', () {
      expect(
        reducer(const TransactionDetailsState(removingInProgress: true), RemoveCompleted()),
        isA<TransactionDetailsState>().having((p0) => p0.removingDone, 'removingDone should be true', true),
      );
    });

    test('SubscribeToTransaction action should clear the state', () {
      expect(
        reducer(
          TransactionDetailsState(removingInProgress: true, transaction: mockTransactions[0], removingDone: true),
          SubscribeToTransaction('some id'),
        ),
        const TransactionDetailsState(),
      );
    });
  });
}
