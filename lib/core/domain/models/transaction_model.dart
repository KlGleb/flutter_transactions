import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required int amount,
    required int commission,
    required int total,
    required int sum,
    required TransactionType type,
    required DateTime date,
  }) = _TransactionModel;
}
