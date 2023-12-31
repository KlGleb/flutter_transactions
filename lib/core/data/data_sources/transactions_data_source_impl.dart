import 'dart:math';

import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/entities/transaction_entity.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

/// Emulates a rest service
class TransactionDataSourceImpl implements TransactionDataSource {
  @override
  Future<List<TransactionEntity>> get transactions async {
    await Future.delayed(const Duration(milliseconds: 1900));
    return _transactions;
  }

  @override
  Future remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _removeTransaction(id);
  }
}

final _random = Random();

final _count = 50 + _random.nextInt(500);

var _transactions = List.generate(
  _count,
  (index) {
    final amount = 100 + _random.nextInt(5000);
    final int commission = amount ~/ 100;
    final total = amount - commission;
    final type = TransactionType.values[_random.nextInt(TransactionType.values.length)];
    final date = DateTime.now()..subtract(Duration(hours: index));
    return TransactionEntity(
      id: '$index',
      amount: amount,
      commission: commission,
      total: total,
      type: type,
      date: date,
    );
  },
);

void _removeTransaction(String id) => _transactions.removeWhere((element) => element.id == id);
