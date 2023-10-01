import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_actions.dart';
import 'package:transactions/core/redux/auth/auth_reducers.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_reducers.dart';
import 'package:transactions/features/login/presentation/state_management/login_reducers.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_reducers.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_reducers.dart';

AppState reducer(AppState state, dynamic action) =>
    combineReducers([_appStateReducer, _clearStateReducer])(state, action);

AppState _appStateReducer(AppState state, dynamic action) => AppState(
      authState: authReducer(state.authState, action),
      loginState: loginReducer(state.loginState, action),
      transactionsState: transactionsReducer(state.transactionsState, action),
      transactionDetailsState: transactionDetailsReducer(state.transactionDetailsState, action),
      donutState: donutReducer(state.donutState, action),
    );

Reducer<AppState> _clearStateReducer = TypedReducer<AppState, LoggedOut>((_, __) => const AppState());
