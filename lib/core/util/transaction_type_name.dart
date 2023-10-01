import 'package:flutter/material.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/util/lang.dart';

extension TransactionTypeName on TransactionType {
  String getName(BuildContext context) {
    switch (this) {
      case TransactionType.deposit:
        return context.lang.transactionTypeDeposit;
      case TransactionType.transfer:
        return context.lang.transactionTypeTransfer;
      case TransactionType.withdrawal:
        return context.lang.transactionTypeWithdrawal;
    }
  }
}
