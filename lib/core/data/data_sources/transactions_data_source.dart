import 'dart:math';

import 'package:transactions/core/data/entities/transaction_entity.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

abstract class TransactionDataSource {
  Future<List<TransactionEntity>> get transactions;

  Future<int> get count;

  Future remove(String id);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  @override
  // TODO: implement count
  Future<int> get count async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return 300;
  }

  @override
  // TODO: implement transactions
  Future<List<TransactionEntity>> get transactions async {
    await Future.delayed(const Duration(milliseconds: 1900));
    return List.generate(
      300,
      (index) => TransactionEntity(
        id: '$index',
        amount: 100,
        commission: 5,
        sum: 300,
        total: 295,
        type: next(0, 2) == 0
            ? TransactionType.transfer
            : next(0, 2) == 1
                ? TransactionType.deposit
                : TransactionType.withdrawal,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Future remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}

final _random = Random();

/// Generates a positive random integer uniformly distributed on the range
/// from [min], inclusive, to [max], exclusive.
int next(int min, int max) => min + _random.nextInt(max - min);
