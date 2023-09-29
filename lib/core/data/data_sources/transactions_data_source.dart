import 'package:transactions/core/data/entities/transaction_entity.dart';

abstract class TransactionDataSource {
  Future<List<TransactionEntity>> get transactions;

  Future<int> get count;

  Future remove(String id);
}
