sealed class LoginAction {}

class Login extends LoginAction {}

class SaveUserName extends LoginAction {
  final String userName;

  SaveUserName(this.userName);
}

class SavePassword extends LoginAction {
  final String password;

  SavePassword(this.password);
}
