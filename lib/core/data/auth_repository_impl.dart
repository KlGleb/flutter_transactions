import 'package:transactions/core/data/data_sources/login_data_source.dart';
import 'package:transactions/core/data/db/dao.dart';
import 'package:transactions/core/domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._dao, this._dataSource);

  final TransactionsDao _dao;
  final LoginDataSource _dataSource;

  @override
  Future logIn(String userName, String password) => _dataSource.login(userName, password);

  @override
  Future logOut() => _dao.clear();
}
