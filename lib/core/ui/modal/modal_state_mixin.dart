import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';
import 'package:flutter_clean_architecture/core/ui/modal/custom_dialog.dart';
import 'package:flutter_clean_architecture/core/ui/modal/custom_dialog_button.dart';

mixin ModalStateMixin<W extends StatefulWidget> on State<W> {
  Future<T?> showSimpleDialog<T>({
    String? title,
    String? message,
    VoidCallback? onConfirmButtonPressed,
    VoidCallback? onCancelButtonPressed,
    bool canPopWithSoftBackKey = true,
    bool dismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return CustomDialog(
          title: title,
          content: message,
          buttons: [
            if (onCancelButtonPressed != null)
              CustomDialogButton.ghost(
                text: 'cancel'.tr(context),
                onPressed: onCancelButtonPressed,
              ),
            if (onConfirmButtonPressed != null)
              CustomDialogButton.color(
                text: 'confirm'.tr(context),
                onPressed: onConfirmButtonPressed,
              ),
          ],
          canPopWithSoftBackKey: canPopWithSoftBackKey,
        );
      },
    );
  }

  Future<T?> showLoadingOverlay<T>({
    WidgetBuilder? loaderBuilder,
    bool canPopWithSoftBackKey = false,
  }) async {
    if (_completer != null) {
      return null;
    }

    final DialogRoute<T> route = _createDialogRoute<T>((context) {
      final Widget loader =
          loaderBuilder?.call(context) ?? const CircularProgressIndicator();

      return PopScope(
        canPop: canPopWithSoftBackKey,
        child: Center(child: loader),
      );
    });

    final Completer completer = _createDialogCompleter(route);
    _completer = completer;

    Navigator.of(context, rootNavigator: true).push(route).then(_complete);

    return await completer.future;
  }

  void hideLoadingOverlay([dynamic result]) {
    _complete(result);
  }

  DialogRoute<T> _createDialogRoute<T>(WidgetBuilder builder) {
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(context, rootNavigator: true).context,
    );

    return DialogRoute<T>(
      context: context,
      builder: builder,
      barrierColor:
          Theme.of(context).dialogTheme.barrierColor ?? Colors.black54,
      barrierDismissible: false,
      useSafeArea: true,
      themes: themes,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
    );
  }

  Completer _createDialogCompleter(DialogRoute route) {
    final Completer completer = Completer();
    completer.future.then((_) {
      if (mounted) {
        Navigator.of(context).removeRoute(route);
      }
    });

    return completer;
  }

  Completer? _completer;

  void _complete(dynamic result) {
    _completer?.complete(result);
    _completer = null;
  }

  @override
  void dispose() {
    hideLoadingOverlay();
    super.dispose();
  }
}
