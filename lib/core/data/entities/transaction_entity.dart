import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

part 'transaction_entity.freezed.dart';
part 'transaction_entity.g.dart';

@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required String id,
    required int amount,
    required int commission,
    required int total,
    required TransactionType type,
    required DateTime date,
  }) = _TransactionEntity;

  factory TransactionEntity.fromJson(Map<String, dynamic> json) => _$TransactionEntityFromJson(json);
}
