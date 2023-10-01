import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool inProgress,
    @Default(false) bool wrongCredentialsError,
    @Default(false) bool unknownError,
    String? userName,
    String? password,
  }) = _LoginState;
}
