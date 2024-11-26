import 'package:flutter_clean_architecture/core/exceptions/custom_exception.dart';
import 'package:flutter_clean_architecture/core/models/result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_login_result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';

abstract class AuthRepository {
  Future<Result<SocialLoginResult, CustomException>> socialLogin(
      SocialType socialType);
}
