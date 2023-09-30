import 'package:transactions/core/domain/models/transaction_model.dart';

abstract class TransactionRepository {
  Stream<Iterable<TransactionModel>> get transactions;

  Stream<int> get count;

  Stream<TransactionModel?> watchById(String id);

  Future remove(String id);

  Future sync();
}
