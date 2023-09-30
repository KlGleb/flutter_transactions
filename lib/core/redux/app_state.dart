import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

part 'app_state.freezed.dart';

typedef DonutState = Map<TransactionType, int>;

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

sealed class AuthState {}

class Unauthorized extends AuthState {
  bool inProgress;

  Unauthorized(this.inProgress);
}

class Authorized extends AuthState {
  bool inProgress;

  Authorized(this.inProgress);
}

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default([]) List<TransactionModel> transactions,
    @Default(0) int count,
  }) = _TransactionsState;
}

@freezed
class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState({
    TransactionModel? transaction,
    @Default(false) bool removingInProgress,
    @Default(false) bool removingDone,
  }) = _TransactionDetailsState;
}
