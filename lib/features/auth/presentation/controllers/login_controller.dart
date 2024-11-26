import 'package:flutter_clean_architecture/core/exceptions/custom_exception.dart';
import 'package:flutter_clean_architecture/core/models/result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_login_result.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';
import 'package:flutter_clean_architecture/features/auth/domain/usecases/social_login.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/controllers/state/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState? build() {
    return null;
  }

  void socialLogin(SocialType socialType) async {
    state = LoginState.loading();

    final result = await ref.read(socialLoginProvider(socialType).future);

    switch (result) {
      case Success<SocialLoginResult, CustomException>():
        state = LoginState.success();
      case Failure<SocialLoginResult, CustomException>():
        state = LoginState.failure(result.exception);
    }
  }
}
