sealed class AuthAction {}

class LoggedIn extends AuthAction {}

class LoggedOut extends AuthAction {}

class LoggedInError extends AuthAction {}

class WrongCredentialsError extends AuthAction {}
