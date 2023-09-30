import 'package:transactions/core/domain/models/transaction_model.dart';

sealed class TransactionAction {}

class TransactionsUpdated extends TransactionAction {
  Iterable<TransactionModel> transactions;

  TransactionsUpdated(this.transactions);
}

class TransactionsCountUpdated extends TransactionAction {
  int count;

  TransactionsCountUpdated(this.count);
}

class GetTransactions extends TransactionAction {}
