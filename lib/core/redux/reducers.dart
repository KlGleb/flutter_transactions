import 'package:redux/redux.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
      _authReducer(state.authState, action),
      _transactionsReducer(state.transactionsState, action),
      _transactionDetailsReducer(state.transactionDetailsState, action),
      _donutReducer(state.donutState, action),
    );

Reducer<AuthState> _authReducer = combineReducers([
  TypedReducer<AuthState, Login>(_loginReducer),
  TypedReducer<AuthState, Logout>(_logoutReducer),
  TypedReducer<AuthState, LoginSuccess>(_loginSuccessReducer),
  TypedReducer<AuthState, LogoutSuccess>(_logoutSuccessReducer),
]);

AuthState _loginReducer(AuthState state, Login action) => Authorized(true);

AuthState _logoutReducer(AuthState state, Logout action) => Unauthorized(true);

AuthState _loginSuccessReducer(AuthState state, LoginSuccess action) => Authorized(false);

AuthState _logoutSuccessReducer(AuthState state, LogoutSuccess action) => Unauthorized(false);

Reducer<TransactionsState> _transactionsReducer = combineReducers([
  TypedReducer<TransactionsState, TransactionsUpdated>(_updateTransactionsReducer),
  TypedReducer<TransactionsState, TransactionsCountUpdated>(_updateTransactionsCountReducer),
]);

TransactionsState _updateTransactionsReducer(TransactionsState state, TransactionsUpdated action) =>
    state.copyWith(transactions: action.transactions.toList());

TransactionsState _updateTransactionsCountReducer(TransactionsState state, TransactionsCountUpdated action) =>
    state.copyWith(count: action.count);

Reducer<TransactionDetailsState> _transactionDetailsReducer = combineReducers([
  TypedReducer<TransactionDetailsState, TransactionDetailsUpdated>(_updateTransactionDetailsReducer),
  TypedReducer<TransactionDetailsState, RemoveTransaction>(_removeTransactionReducer),
  TypedReducer<TransactionDetailsState, RemoveCompleted>(_removeCompletedReducer),
  // TypedReducer<TransactionDetailsState, TransactionDetailsClear>(_clearTransactionDetailsReducer),
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

/*TransactionDetailsState _clearTransactionDetailsReducer(
  TransactionDetailsState state,
    TransactionDetailsClear action,
) =>
    const TransactionDetailsState();*/

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

Reducer<DonutState> _donutReducer = combineReducers([
  TypedReducer<DonutState, DonutUpdated>(_donutUpdated),
]);
// DonutUpdated
DonutState _donutUpdated(DonutState state, DonutUpdated action) => action.data;
