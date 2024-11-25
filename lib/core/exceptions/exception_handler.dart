import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../logger.dart';
import '../models/result.dart';
import 'api_exception.dart';
import 'custom_exception.dart';

part 'exception_handler.g.dart';

@Riverpod(keepAlive: true)
ExceptionHandler exceptionHandler(Ref ref) {
  return ExceptionHandlerImpl();
}

abstract class ExceptionHandler {
  Future<Result<V, CustomException>> tryCall<V>(AsyncValueGetter<V> f);
}

class ExceptionHandlerImpl implements ExceptionHandler {
  @override
  Future<Result<V, CustomException>> tryCall<V>(AsyncValueGetter<V> f) async {
    try {
      return Success(await f());
    } catch (e, s) {
      final CustomException exception = transformCustomException(e);
      Logger.error('$exception\n$s');

      return Failure(exception);
    }
  }
}

CustomException transformCustomException(Object e) {
  if (e is DioException) {
    return transformApiException(e);
  }
  return CustomException(e.toString());
}

ApiException transformApiException(DioException e) {
  final Response? response = e.response;
  if (response == null) {
    final DioExceptionType exceptionType = e.type;
    if (exceptionType == DioExceptionType.connectionTimeout ||
        exceptionType == DioExceptionType.sendTimeout ||
        exceptionType == DioExceptionType.receiveTimeout) {
      return ApiException.timeout();
    }
    return ApiException.unknown(e.message);
  }

  return switch (response.statusCode) {
    400 => ApiException.badRequest(),
    401 => ApiException.unauthorized(),
    404 => ApiException.notFound(),
    500 || 501 || 502 || 503 => ApiException.server(),
    _ => ApiException.unknown(),
  };
}
