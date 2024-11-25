import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.logoAsset,
    required this.label,
    this.logoBackgroundColor,
    this.backgroundColor,
    this.borderColor,
    this.labelColor,
    this.onPressed,
  });

  final String logoAsset;
  final String label;
  final Color? logoBackgroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? labelColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const double radius = 6.0;

    return SizedBox(
      height: 46.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: borderColor == null
                  ? BorderSide.none
                  : BorderSide(color: borderColor!),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: logoBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(logoAsset, width: 16.0, height: 16.0),
              ),
            ),
            Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
