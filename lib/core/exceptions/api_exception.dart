import 'custom_exception.dart';

class ApiException extends CustomException {
  const ApiException({required this.type, String? message}) : super(message);

  final ApiExceptionType type;

  factory ApiException.badRequest([String? message]) =>
      ApiException(type: ApiExceptionType.badRequest, message: message);

  factory ApiException.unauthorized([String? message]) =>
      ApiException(type: ApiExceptionType.unauthorized, message: message);

  factory ApiException.forbidden([String? message]) =>
      ApiException(type: ApiExceptionType.forbidden, message: message);

  factory ApiException.notFound([String? message]) =>
      ApiException(type: ApiExceptionType.notFound, message: message);

  factory ApiException.server([String? message]) =>
      ApiException(type: ApiExceptionType.server, message: message);

  factory ApiException.timeout([String? message]) =>
      ApiException(type: ApiExceptionType.timeout, message: message);

  factory ApiException.unknown([String? message]) =>
      ApiException(type: ApiExceptionType.unknown, message: message);
}

enum ApiExceptionType {
  /// statusCode: 400
  badRequest,

  /// statusCode: 401
  unauthorized,

  /// statusCode: 403
  forbidden,

  /// statusCode: 404
  notFound,

  /// statusCode: 500, 501, 502, 503
  server,

  /// connection, send, receive timeout
  timeout,

  /// unknown statusCode
  unknown,
}
