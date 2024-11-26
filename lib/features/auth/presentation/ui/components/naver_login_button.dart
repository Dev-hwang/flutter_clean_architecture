import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/constants/assets_path.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/ui/components/login_button.dart';

class NaverLoginButton extends StatelessWidget {
  const NaverLoginButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      logoAsset: AssetsPath.icons.naverLogo,
      label: 'login_naver'.tr(context),
      backgroundColor: const Color(0xFF03C75A),
      labelColor: const Color(0xFFFFFFFF),
      onPressed: onPressed,
    );
  }
}
