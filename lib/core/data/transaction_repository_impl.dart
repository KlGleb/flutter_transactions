import 'package:rxdart/rxdart.dart';
import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/mappers/transaction_entity_mapper.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _dataSource;
  final BehaviorSubject<Iterable<TransactionModel>> _transactions = BehaviorSubject();
  final BehaviorSubject<int> _count = BehaviorSubject();

  TransactionRepositoryImpl(this._dataSource);

  @override
  Stream<Iterable<TransactionModel>> get transactions => _transactions;

  @override
  Stream<int> get count => _count;

  @override
  Future get() async {
    _dataSource.count.then((value) => _count.add(value));
    _dataSource.transactions.then((value) => _transactions.add(value.map((e) => e.model)));
  }

  @override
  Stream<TransactionModel> watchById(String id) {
    return Stream.fromIterable([_transactions.value.first.copyWith(id: id)]);
  }
}
