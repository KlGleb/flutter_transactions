import 'package:mockito/annotations.dart';
import 'package:transactions/core/data/data_sources/login_data_source.dart';
import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/db/database.dart';
import 'package:transactions/core/data/entities/transaction_entity.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';

@GenerateNiceMocks([
  MockSpec<TransactionsDao>(),
  MockSpec<LoginDataSource>(),
  MockSpec<TransactionDataSource>(),
])
export 'mock_sources.mocks.dart';

final _time = DateTime.parse('2020-01-02 03:04:05');

final List<TransactionModel> mockTransactions = List.generate(
  15,
  (index) => TransactionModel(
    id: 'id$index',
    amount: index,
    commission: index,
    total: index,
    type: TransactionType.deposit,
    date: _time,
  ),
);

final List<TransactionEntity> mockTransactionsEntities = List.generate(
  15,
  (index) => TransactionEntity(
    id: 'id$index',
    amount: index,
    commission: index,
    total: index,
    type: TransactionType.deposit,
    date: _time,
  ),
);

final List<TransactionDto> mockTransactionDtos = List.generate(
  15,
  (index) => TransactionDto(
    id: 'id$index',
    amount: index,
    commission: index,
    total: index,
    type: TransactionType.deposit,
    date: _time,
  ),
);

final mockTransactionDtos2 = [mockTransactionDtos[0], mockTransactionDtos[1]];
final mockTransactions2 = [mockTransactions[0], mockTransactions[1]];
