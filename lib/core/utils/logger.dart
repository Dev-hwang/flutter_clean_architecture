import 'package:flutter/foundation.dart';

import '../models/ansi_color.dart';

abstract class Logger {
  static void debug(String message) => log(LogLevel.debug, message);

  static void info(String message) => log(LogLevel.info, message);

  static void warning(String message) => log(LogLevel.warning, message);

  static void error(String message) => log(LogLevel.error, message);

  static void fatal(String message) => log(LogLevel.fatal, message);

  static void log(LogLevel level, String message) {
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
