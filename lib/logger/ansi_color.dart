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
