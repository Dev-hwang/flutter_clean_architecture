import 'package:flutter/material.dart';

Future<T?> showCommonDialog<T>({
  required BuildContext context,
  String? title,
  String? content,
  VoidCallback? onConfirmButtonPressed,
  bool canPopWithSoftBackKey = true,
  bool dismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    builder: (context) {
      return CommonDialog(
        title: title,
        content: content,
        onConfirmButtonPressed: () => onConfirmButtonPressed?.call(),
        canPopWithSoftBackKey: canPopWithSoftBackKey,
      );
    },
  );
}

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    this.backgroundColor,
    this.radius = 4.0,
    this.title,
    this.titleBuilder,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentBuilder,
    this.contentPadding,
    this.contentTextStyle,
    this.confirmButtonText,
    this.confirmButtonTextStyle,
    this.confirmButtonColor,
    this.willPopWhenConfirmButtonPressed = true,
    this.onConfirmButtonPressed,
    this.cancelButtonText,
    this.cancelButtonTextStyle,
    this.cancelButtonColor,
    this.willPopWhenCancelButtonPressed = true,
    this.onCancelButtonPressed,
    this.canPopWithSoftBackKey = true,
  });

  final Color? backgroundColor;
  final double radius;

  final String? title;
  final WidgetBuilder? titleBuilder;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;

  final String? content;
  final WidgetBuilder? contentBuilder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;

  final String? confirmButtonText;
  final TextStyle? confirmButtonTextStyle;
  final Color? confirmButtonColor;
  final bool willPopWhenConfirmButtonPressed;
  final VoidCallback? onConfirmButtonPressed;

  final String? cancelButtonText;
  final TextStyle? cancelButtonTextStyle;
  final Color? cancelButtonColor;
  final bool willPopWhenCancelButtonPressed;
  final VoidCallback? onCancelButtonPressed;

  final bool canPopWithSoftBackKey;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPopWithSoftBackKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        backgroundColor: backgroundColor,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: IntrinsicWidth(
          stepWidth: 56.0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _CommonDialogTitle(),
                _CommonDialogContent(),
                _CommonDialogButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CommonDialogTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CommonDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CommonDialogButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
