import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final AuthState authState;

  const AppState(this.authState);
}

sealed

class AuthState {}

class Unauthorized extends AuthState {
  bool inProgress;

  Unauthorized(this.inProgress);
}

class Authorized extends AuthState {
  bool inProgress;

  Authorized(this.inProgress);
}
