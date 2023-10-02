import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/data/db/database.dart';

import '../util/mock_sources.dart';

void main() {
  group('TransactionsDao tests', () {
    late AppDatabase database;
    late TransactionsDao dao;

    final dtos = mockTransactionDtos;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      database = AppDatabase();
      dao = database.transactionsDao;
    });

    tearDown(() => database.close());

    test('dao.updAll() should clear and update the table', () async {
      await dao.updAll([dtos[0].copyWith(id: 'some id')]);
      await dao.updAll(dtos);

      expect(await dao.watchTransactions.first, dtos);
    });

    test('dao.remove() should remove a transaction from the table', () async {
      await dao.updAll([dtos[0], dtos[1], dtos[2]]);
      await dao.remove(dtos[1].id);
      expect(await dao.watchTransactions.first, [dtos[0], dtos[2]]);
    });

    test('dao.watchTransactions should emit new values when the table is changed', () async {
      expectLater(
        dao.watchTransactions,
        emitsInOrder([
          [],
          orderedEquals([dtos[0], dtos[1], dtos[2]]),
          orderedEquals([dtos[0], dtos[2]]),
        ]),
      );
      await dao.updAll([dtos[0], dtos[1], dtos[2]]);
      await dao.remove(dtos[1].id);
    });

    test('dao.watchById() should emit null or appropriate value', () async {
      expectLater(
        dao.watchById(dtos[9].id),
        emitsInOrder([null, dtos[9], null]),
      );

      await dao.updAll([dtos[0]]);
      await dao.updAll(dtos);
      await dao.remove(dtos[9].id);
    });

    test('dao.clear() should remove all values from the table', () async {
      await dao.updAll(dtos);
      await dao.clear();
      expect(await dao.watchTransactions.first, []);
    });
  });
}
