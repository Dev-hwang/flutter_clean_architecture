import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/routers/router.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';
import 'package:flutter_clean_architecture/core/ui/modal/modal_state_mixin.dart';
import 'package:flutter_clean_architecture/features/auth/domain/models/social_type.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/controllers/state/login_state.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/ui/components/apple_login_button.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/ui/components/google_login_button.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/ui/components/kakao_login_button.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/ui/components/naver_login_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with ModalStateMixin {
  void _onLoginButtonPressed(SocialType socialType) {
    ref.read(loginControllerProvider.notifier).socialLogin(socialType);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (_, currState) {
      if (currState == null) {
        return;
      }

      switch (currState) {
        case LoginLoading():
          showLoadingOverlay();
        case LoginSuccess():
          context.go(Routes.home);
        case LoginFailure():
          hideLoadingOverlay();
          showSimpleDialog(
            message: currState.exception.toString(),
            onConfirmButtonPressed: context.pop,
          );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 42.0, 32.0, 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildWelcomeMessage()),
              ..._buildLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Text(
      'welcome'.tr(context),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  List<Widget> _buildLoginButtons() {
    const SizedBox loginButtonSpacer = SizedBox(height: 8.0);

    return [
      NaverLoginButton(
        onPressed: () => _onLoginButtonPressed(SocialType.naver),
      ),
      loginButtonSpacer,
      KakaoLoginButton(
        onPressed: () => _onLoginButtonPressed(SocialType.kakao),
      ),
      loginButtonSpacer,
      if (Platform.isIOS)
        AppleLoginButton(
          onPressed: () => _onLoginButtonPressed(SocialType.apple),
        )
      else
        GoogleLoginButton(
          onPressed: () => _onLoginButtonPressed(SocialType.google),
        ),
    ];
  }
}
