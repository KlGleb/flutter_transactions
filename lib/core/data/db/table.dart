import 'package:drift/drift.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

@DataClassName('TransactionDto')
class Transactions extends Table {
  TextColumn get id => text()();

  IntColumn get amount => integer()();

  IntColumn get commission => integer()();

  IntColumn get total => integer()();

  TextColumn get type => textEnum<TransactionType>()();

  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
