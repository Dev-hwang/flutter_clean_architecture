import 'package:flutter_clean_architecture/core/exceptions/custom_exception.dart';
import 'package:flutter_clean_architecture/core/models/result.dart';
import 'package:flutter_clean_architecture/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_login_result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'social_login.g.dart';

@riverpod
Future<Result<SocialLoginResult, CustomException>> socialLogin(
  Ref ref,
  SocialType socialType,
) {
  return ref.watch(authRepositoryProvider).socialLogin(socialType);
}
