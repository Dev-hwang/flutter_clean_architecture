import 'package:flutter/foundation.dart';

abstract class Logger {
  static void debug(String message) => _log(LogLevel.debug, message);

  static void info(String message) => _log(LogLevel.info, message);

  static void warning(String message) => _log(LogLevel.warning, message);

  static void error(String message) => _log(LogLevel.error, message);

  static void fatal(String message) => _log(LogLevel.fatal, message);

  static void _log(LogLevel level, String message) {
    if (kDebugMode) {
      final String emoji = level.emoji;
      final String ansiMessage = level.ansiColor(message);
      final String fullMessage = '$emoji $ansiMessage';
      print(fullMessage);
    }
  }
}

enum LogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
}

extension LogLevelExtension on LogLevel {
  AnsiColor get ansiColor {
    return switch (this) {
      LogLevel.debug => const AnsiColor.none(),
      LogLevel.info => const AnsiColor.code(12),
      LogLevel.warning => const AnsiColor.code(208),
      LogLevel.error => const AnsiColor.code(196),
      LogLevel.fatal => const AnsiColor.code(199),
    };
  }

  String get emoji {
    return switch (this) {
      LogLevel.debug => '🐛',
      LogLevel.info => '💡',
      LogLevel.warning => '⚠️',
      LogLevel.error => '⛔',
      LogLevel.fatal => '💥',
    };
  }
}

class AnsiColor {
  static const String ansiEsc = '\x1B[';
  static const String ansiDefault = '${ansiEsc}0m';

  const AnsiColor.none() : code = null;

  const AnsiColor.code(this.code);

  final int? code;

  // Callable: https://dart.dev/language/callable-objects
  String call(String message) {
    if (code != null) {
      return '$this$message$ansiDefault';
    } else {
      return message;
    }
  }

  @override
  String toString() {
    if (code != null) {
      return '${ansiEsc}38;5;${code}m';
    } else {
      return '';
    }
  }
}
