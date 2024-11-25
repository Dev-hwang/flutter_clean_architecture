import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';

import '../../../../../constants/assets_path.dart';
import 'login_button.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      logoAsset: AssetsPath.icons.googleLogo,
      label: 'login_google'.tr(context),
      logoBackgroundColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFF4185F4),
      borderColor: const Color(0xFF4185F4),
      labelColor: const Color(0xFFFFFFFF),
      onPressed: onPressed,
    );
  }
}
