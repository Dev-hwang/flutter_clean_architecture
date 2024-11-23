import 'package:flutter/foundation.dart';

import 'log_level.dart';

export 'log_level.dart';

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
