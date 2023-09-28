import 'package:rxdart/rxdart.dart';
import 'package:transactions/core/domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _loginStatus = BehaviorSubject<bool>()
    ..add(false);

  @override
  Future logIn(String userName, String password) async => _loginStatus.add(true);

  @override
  Future logOut() async => _loginStatus.add(false);

  @override
  Stream<bool> get loginStatus => _loginStatus;
}