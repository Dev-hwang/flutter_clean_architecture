import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton.color({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.onPressed,
  })  : style = CustomDialogButtonStyle.color,
        borderColor = null;

  const CustomDialogButton.ghost({
    super.key,
    required this.text,
    this.textStyle,
    this.borderColor,
    this.radius,
    this.onPressed,
  })  : style = CustomDialogButtonStyle.ghost,
        backgroundColor = null;

  final CustomDialogButtonStyle style;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(radius ?? 4.0),
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
    );

    if (style == CustomDialogButtonStyle.ghost) {
      return OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(text, style: textStyle),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(text, style: textStyle),
    );
  }
}

enum CustomDialogButtonStyle {
  color,
  ghost,
}
