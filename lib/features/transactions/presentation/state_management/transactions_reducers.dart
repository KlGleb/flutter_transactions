import 'package:redux/redux.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_state.dart';

Reducer<TransactionsState> transactionsReducer = combineReducers([
  TypedReducer<TransactionsState, TransactionsUpdated>(_updateTransactionsReducer),
  TypedReducer<TransactionsState, TransactionsCountUpdated>(_updateTransactionsCountReducer),
  TypedReducer<TransactionsState, SyncTransactions>(_getTransactionsReducer),
  TypedReducer<TransactionsState, SyncCompleted>(_syncCompletedReducer),
]);

TransactionsState _updateTransactionsReducer(TransactionsState state, TransactionsUpdated action) =>
    state.copyWith(transactions: action.transactions.toList());

TransactionsState _updateTransactionsCountReducer(TransactionsState state, TransactionsCountUpdated action) =>
    state.copyWith(count: action.count);

TransactionsState _getTransactionsReducer(TransactionsState state, SyncTransactions action) =>
    state.copyWith(synchronizing: true);

TransactionsState _syncCompletedReducer(TransactionsState state, SyncCompleted action) =>
    state.copyWith(synchronizing: false);
