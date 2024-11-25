import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';

import '../../../../../constants/assets_path.dart';
import 'login_button.dart';

class KakaoLoginButton extends StatelessWidget {
  const KakaoLoginButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      logoAsset: AssetsPath.icons.kakaoLogo,
      label: 'login_kakao'.tr(context),
      backgroundColor: const Color(0xFFFFE500),
      labelColor: const Color(0xFF000000),
      onPressed: onPressed,
    );
  }
}
