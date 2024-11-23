import 'ansi_color.dart';

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
