import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
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
    this.buttons = const [],
    this.buttonsPadding,
    this.buttonsSpacing = 12.0,
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

  final List<Widget> buttons;
  final EdgeInsetsGeometry? buttonsPadding;
  final double buttonsSpacing;

  final bool canPopWithSoftBackKey;

  @override
  Widget build(BuildContext context) {
    final bool containsTitle = title != null || titleBuilder != null;
    Widget? titleWidget;
    if (containsTitle) {
      titleWidget = _CustomDialogTitle(
        title: title,
        titleBuilder: titleBuilder,
        titlePadding:
            titlePadding ?? const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 20.0),
        titleTextStyle: titleTextStyle,
      );
    }

    final Widget contentWidget = _CustomDialogContent(
      content: content,
      contentBuilder: contentBuilder,
      contentPadding: contentPadding ??
          (containsTitle
              ? const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0)
              : const EdgeInsets.all(24.0)),
      contentTextStyle: contentTextStyle,
    );

    Widget? buttonsWidget;
    if (buttons.isNotEmpty) {
      final int buttonsCount = buttons.length;
      final Widget buttonsSpacer = SizedBox(width: buttonsSpacing);

      final List<Widget> rowChildren = [];
      for (var i = 0; i < buttonsCount; i++) {
        rowChildren.add(Expanded(child: buttons[i]));
        if (i != buttonsCount - 1) {
          rowChildren.add(buttonsSpacer);
        }
      }

      buttonsWidget = Padding(
        padding:
            buttonsPadding ?? const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowChildren,
        ),
      );
    }

    return PopScope(
      canPop: canPopWithSoftBackKey,
      child: AlertDialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: IntrinsicWidth(
          stepWidth: 56.0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (titleWidget != null) titleWidget,
                  contentWidget,
                  if (buttonsWidget != null) buttonsWidget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomDialogTitle extends StatelessWidget {
  const _CustomDialogTitle({
    this.title,
    this.titleBuilder,
    this.titlePadding,
    this.titleTextStyle,
  });

  final String? title;
  final WidgetBuilder? titleBuilder;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    if (titleBuilder != null) {
      return Container(
        padding: titlePadding,
        child: titleBuilder!.call(context),
      );
    }

    final TextStyle? themeTextStyle =
        Theme.of(context).dialogTheme.titleTextStyle ??
            Theme.of(context).textTheme.titleMedium;

    return Container(
      padding: titlePadding,
      child: Text(
        title ?? '',
        style: themeTextStyle?.merge(titleTextStyle),
      ),
    );
  }
}

class _CustomDialogContent extends StatelessWidget {
  const _CustomDialogContent({
    this.content,
    this.contentBuilder,
    this.contentPadding,
    this.contentTextStyle,
  });

  final String? content;
  final WidgetBuilder? contentBuilder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;

  @override
  Widget build(BuildContext context) {
    if (contentBuilder != null) {
      return Container(
        padding: contentPadding,
        child: contentBuilder!.call(context),
      );
    }

    final TextStyle? themeTextStyle =
        Theme.of(context).dialogTheme.contentTextStyle ??
            Theme.of(context).textTheme.bodyMedium;

    return Container(
      padding: contentPadding,
      child: Text(
        content ?? '',
        style: themeTextStyle?.merge(contentTextStyle),
      ),
    );
  }
}
