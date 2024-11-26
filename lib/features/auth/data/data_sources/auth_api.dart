import 'package:flutter_clean_architecture/core/infrastructure/dio/dio_client.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_login_result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(Ref ref) {
  return AuthApiImpl(ref.watch(dioClientProvider));
}

abstract class AuthApi {
  Future<SocialLoginResult> socialLogin(SocialType socialType);
}

class AuthApiImpl implements AuthApi {
  const AuthApiImpl(this.dioClient);

  final DioClient dioClient;

  @override
  Future<SocialLoginResult> socialLogin(SocialType socialType) async {
    // for demo
    await Future.delayed(const Duration(seconds: 3));

    return SocialLoginResult(
      socialType: socialType,
      email: 'hwj930513@naver.com',
    );
  }
}
