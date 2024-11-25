import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';

import '../../../../../constants/assets_path.dart';
import 'login_button.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      logoAsset: AssetsPath.icons.appleLogo,
      label: 'login_apple'.tr(context),
      backgroundColor: const Color(0xFF050708),
      labelColor: const Color(0xFFFFFFFF),
      onPressed: onPressed,
    );
  }
}
