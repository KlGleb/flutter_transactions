import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';

part 'transaction_details_state.freezed.dart';

@freezed
class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState({
    TransactionModel? transaction,
    @Default(false) bool removingInProgress,
    @Default(false) bool removingDone,
  }) = _TransactionDetailsState;
}
