import 'package:redux/redux.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_state.dart';

Reducer<TransactionDetailsState> transactionDetailsReducer = combineReducers([
  TypedReducer<TransactionDetailsState, TransactionDetailsUpdated>(_updateTransactionDetailsReducer),
  TypedReducer<TransactionDetailsState, RemoveTransaction>(_removeTransactionReducer),
  TypedReducer<TransactionDetailsState, RemoveCompleted>(_removeCompletedReducer),
  TypedReducer<TransactionDetailsState, SubscribeToTransaction>(_clearTransactionDetailsReducer),
]);

TransactionDetailsState _updateTransactionDetailsReducer(
  TransactionDetailsState state,
  TransactionDetailsUpdated action,
) =>
    state.copyWith(transaction: action.transaction);

TransactionDetailsState _clearTransactionDetailsReducer(
  TransactionDetailsState state,
  SubscribeToTransaction action,
) =>
    const TransactionDetailsState();

TransactionDetailsState _removeTransactionReducer(
  TransactionDetailsState state,
  RemoveTransaction action,
) =>
    state.copyWith(removingInProgress: true);

TransactionDetailsState _removeCompletedReducer(
  TransactionDetailsState state,
  RemoveCompleted action,
) =>
    state.copyWith(removingDone: true);
