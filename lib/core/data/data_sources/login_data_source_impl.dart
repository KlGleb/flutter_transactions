import 'package:transactions/core/data/data_sources/login_data_source.dart';
import 'package:transactions/core/exceptions/auth_exception.dart';

/// Emulates Rest service
class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (userName != 'user' || password != 'password') {
      throw WrongCredentialsException();
    }
  }
}
