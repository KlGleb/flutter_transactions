import 'package:redux/redux.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_state.dart';

Reducer<TransactionsState> transactionsReducer = combineReducers([
  TypedReducer<TransactionsState, TransactionsUpdated>(_updateTransactionsReducer),
  TypedReducer<TransactionsState, TransactionsCountUpdated>(_updateTransactionsCountReducer),
]);

TransactionsState _updateTransactionsReducer(TransactionsState state, TransactionsUpdated action) =>
    state.copyWith(transactions: action.transactions.toList());

TransactionsState _updateTransactionsCountReducer(TransactionsState state, TransactionsCountUpdated action) =>
    state.copyWith(count: action.count);
