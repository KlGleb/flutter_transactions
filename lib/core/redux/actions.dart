sealed

class AuthAction {}

class Login extends AuthAction {
  final String userName;
  final String password;

  Login(this.userName, this.password);
}

class Logout extends AuthAction {}

class LoginSuccess extends AuthAction {}

class LogoutSuccess extends AuthAction {}
