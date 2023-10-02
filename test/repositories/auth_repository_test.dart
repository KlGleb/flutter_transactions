import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:transactions/core/data/auth_repository_impl.dart';
import 'package:transactions/core/data/data_sources/login_data_source.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/domain/auth_repository.dart';

import '../util/mock_sources.dart';

void main() {
  group('AuthRepositoryImpl tests', () {
    late LoginDataSource dataSource;
    late TransactionsDao dao;
    late AuthRepository repository;

    setUp(() {
      dataSource = MockLoginDataSource();
      dao = MockTransactionsDao();
      repository = AuthRepositoryImpl(dao, dataSource);
    });

    test('login() should call dataSource.login()', () {
      repository.logIn('userName', 'password');
      verify(dataSource.login('userName', 'password'));
    });

    test('logOut() should clear all user data', () {
      repository.logOut();
      verify(dao.clear());
    });
  });
}
