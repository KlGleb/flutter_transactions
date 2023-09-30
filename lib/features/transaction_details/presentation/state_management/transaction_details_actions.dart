import 'package:transactions/core/domain/models/transaction_model.dart';

sealed class TransactionDetailsAction {}

class TransactionDetailsUpdated extends TransactionDetailsAction {
  TransactionModel? transaction;

  TransactionDetailsUpdated(this.transaction);
}

class TransactionDetailsClear extends TransactionDetailsAction {}

class RemoveTransaction extends TransactionDetailsAction {
  final String id;

  RemoveTransaction(this.id);
}

class RemoveCompleted extends TransactionDetailsAction {}

class SubscribeToTransaction extends TransactionDetailsAction {
  String transactionId;

  SubscribeToTransaction(this.transactionId);
}

class UnsubscribeFromTransaction extends TransactionDetailsAction {}
