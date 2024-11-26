import 'dart:async';

import 'package:flutter/material.dart';

mixin LoadingOverlayMixin<W extends StatefulWidget> on State<W> {
  Future<T?> showLoadingOverlay<T>({WidgetBuilder? loaderBuilder}) async {
    if (_completer != null) {
      return null;
    }

    final DialogRoute route = _createRoute((context) {
      final Widget loader =
          loaderBuilder?.call(context) ?? const CircularProgressIndicator();

      return PopScope(
        canPop: false,
        child: Center(child: loader),
      );
    });

    final Completer completer = _createCompleter(route);
    _completer = completer;

    Navigator.of(context, rootNavigator: true).push(route).then(_complete);

    return await completer.future;
  }

  void hideLoadingOverlay([dynamic result]) {
    _complete(result);
  }

  DialogRoute<T> _createRoute<T>(WidgetBuilder builder) {
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

  Completer _createCompleter(DialogRoute route) {
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
