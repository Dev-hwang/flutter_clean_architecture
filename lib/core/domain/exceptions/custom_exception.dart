class CustomException implements Exception {
  const CustomException([this.message]);

  final String? message;

  @override
  String toString() {
    final Type type = runtimeType;
    final String? message = this.message;

    return (message == null) ? '$type' : '$type: $message';
  }
}
