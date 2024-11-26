import 'package:flutter_clean_architecture/core/exceptions/custom_exception.dart';

sealed class LoginState {
  const LoginState();

  factory LoginState.loading() => const LoginLoading();

  factory LoginState.success() => const LoginSuccess();

  factory LoginState.failure(CustomException exception) =>
      LoginFailure(exception);
}

final class LoginLoading extends LoginState {
  const LoginLoading();
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();
}

final class LoginFailure extends LoginState {
  const LoginFailure(this.exception);

  final CustomException exception;
}
