import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';
import 'package:transactions/features/login/presentation/state_management/login_state.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_state.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final TransactionsState transactionsState;
  final TransactionDetailsState transactionDetailsState;
  final DonutState donutState;

  const AppState(
    this.authState, [
    this.transactionsState = const TransactionsState(),
    this.transactionDetailsState = const TransactionDetailsState(),
    this.donutState = const {},
  ]);
}


