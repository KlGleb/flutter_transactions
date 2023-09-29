import 'package:transactions/core/data/entities/transaction_entity.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';

extension TransactionEntityMapper on TransactionEntity {
  TransactionModel get model => TransactionModel(
        id: id,
        amount: amount,
        commission: commission,
        sum: sum,
        type: type,
        date: date,
      );
}
