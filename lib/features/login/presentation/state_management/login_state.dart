sealed class AuthState {}

class Unauthorized extends AuthState {
  bool inProgress;

  Unauthorized(this.inProgress);
}

class Authorized extends AuthState {
  bool inProgress;

  Authorized(this.inProgress);
}
