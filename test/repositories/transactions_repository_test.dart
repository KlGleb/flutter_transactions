import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:transactions/core/data/data_sources/transactions_data_source.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/transaction_repository_impl.dart';
import 'package:transactions/core/domain/transaction_repository.dart';

import '../util/mock_sources.dart';

void main() {
  group('TransactionRepositoryImpl tests', () {
    late TransactionDataSource dataSource;
    late TransactionsDao dao;
    late TransactionRepository repository;

    const newTransactionAmount = 123;

    setUp(() {
      dataSource = MockTransactionDataSource();
      dao = MockTransactionsDao();
      when(dao.watchTransactions).thenAnswer((_) => Stream.fromIterable([mockTransactionDtos, mockTransactionDtos2]));

      when(dataSource.transactions).thenAnswer((_) => Future.value(mockTransactionsEntities));
      repository = TransactionRepositoryImpl(dataSource, dao);
    });

    test('transactions should emit transactions from dao', () {
      expectLater(repository.transactions, emitsInOrder([mockTransactions, mockTransactions2]));
      verify(dao.watchTransactions);
    });

    test('count should emit transactions length', () {
      when(dao.watchTransactions).thenAnswer((_) => Stream.fromIterable([mockTransactionDtos, mockTransactionDtos2]));
      expectLater(repository.count, emitsInOrder([mockTransactionDtos.length, mockTransactionDtos2.length]));
    });

    test('sync() should update dao', () async {
      await repository.sync();
      verify(dataSource.transactions);
      verify(dao.updAll(mockTransactionDtos));
    });

    test('watchById() should emit transaction', () async {
      when(dao.watchById(mockTransactions[0].id)).thenAnswer(
        (_) => Stream.fromIterable(
          [mockTransactionDtos[0], mockTransactionDtos[0].copyWith(amount: newTransactionAmount)],
        ),
      );

      expectLater(
        repository.watchById(mockTransactionDtos[0].id),
        emitsInOrder([
          mockTransactions[0],
          mockTransactions[0].copyWith(amount: newTransactionAmount),
        ]),
      );
    });

    test('remove() should remove element from dao and datasource', () async {
      await repository.remove('id');
      verify(dataSource.remove('id'));
      verify(dao.remove('id'));
    });
  });
}
