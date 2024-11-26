import 'package:flutter_clean_architecture/core/exceptions/custom_exception.dart';
import 'package:flutter_clean_architecture/core/exceptions/exception_handler.dart';
import 'package:flutter_clean_architecture/core/models/result.dart';
import 'package:flutter_clean_architecture/features/auth/data/data_sources/auth_api.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_login_result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    ref.watch(authApiProvider),
    ref.watch(exceptionHandlerProvider),
  );
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.authApi, this.exceptionHandler);

  final AuthApi authApi;
  final ExceptionHandler exceptionHandler;

  @override
  Future<Result<SocialLoginResult, CustomException>> socialLogin(
      SocialType socialType) {
    return exceptionHandler.tryCall(() async {
      return await authApi.socialLogin(socialType);
    });
  }
}
