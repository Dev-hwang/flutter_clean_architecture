import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';

class SocialLoginResult {
  const SocialLoginResult({
    required this.socialType,
    required this.email,
  });

  final SocialType socialType;
  final String email;
}
