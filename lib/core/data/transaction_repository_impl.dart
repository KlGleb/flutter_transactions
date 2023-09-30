import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/mappers/transaction_dto_mapper.dart';
import 'package:transactions/core/data/mappers/transaction_entity_mapper.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _dataSource;
  final TransactionsDao _dao;

  TransactionRepositoryImpl(this._dataSource, this._dao);

  @override
  Stream<Iterable<TransactionModel>> get transactions =>
      _dao.watchTransactions.map((event) => event.map((e) => e.model));

  @override
  Stream<int> get count => transactions.map((event) => event.length);

  @override
  Future sync() => _dataSource.transactions.then((value) => _dao.updAll(value.map((e) => e.dto)));

  @override
  Stream<TransactionModel?> watchById(String id) => _dao.watchById(id).map((event) => event?.model);

  @override
  Future remove(String id) => _dataSource.remove(id).then((value) => _dao.remove(id));
}
