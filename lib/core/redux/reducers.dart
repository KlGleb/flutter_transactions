import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_reducers.dart';
import 'package:transactions/features/login/presentation/state_management/login_reducers.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_reducers.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_reducers.dart';

AppState reducer(AppState state, dynamic action) => AppState(
      authReducer(state.authState, action),
      transactionsReducer(state.transactionsState, action),
      transactionDetailsReducer(state.transactionDetailsState, action),
      donutReducer(state.donutState, action),
    );
