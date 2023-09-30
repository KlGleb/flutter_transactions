import 'package:drift/drift.dart';
import 'package:transactions/core/data/db/database.dart';
import 'package:transactions/core/data/db/table.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<AppDatabase> with _$TransactionsDaoMixin {
  TransactionsDao(AppDatabase db) : super(db);

  Stream<Iterable<TransactionDto>> get watchTransactions => (select(transactions)).watch();

  Stream<TransactionDto?> watchById(String id) =>
      (select(transactions)..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();

  Future remove(String id) => (delete(transactions)..where((tbl) => tbl.id.equals(id))).go();

  Future clear() => transactions.deleteAll();

  Future updAll(Iterable<TransactionDto> dtos) => transaction(() async {
        await transactions.deleteAll();
        await transactions.insertAll(dtos);
      });
}
