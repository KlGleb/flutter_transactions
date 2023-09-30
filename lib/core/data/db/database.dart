import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/db/table.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Transactions], daos: [TransactionsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// Using in-memory database for now
LazyDatabase _openConnection() => LazyDatabase(() async => NativeDatabase.memory());
