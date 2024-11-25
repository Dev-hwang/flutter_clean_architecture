import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'interceptors/logging_interceptor.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  return DioClientImpl(
    interceptors: [
      LoggingInterceptor(),
    ],
  );
}

abstract class DioClient {
  /// Convenience method to make an HTTP GET request.
  FutureOr<Response<T>> httpGet<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  /// Convenience method to make an HTTP POST request.
  FutureOr<Response<T>> httpPost<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  /// Convenience method to make an HTTP PUT request.
  FutureOr<Response<T>> httpPut<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  /// Convenience method to make an HTTP DELETE request.
  FutureOr<Response<T>> httpDelete<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}

class DioClientImpl implements DioClient {
  DioClientImpl({
    Duration? connectTimeout = const Duration(seconds: 10),
    Duration? receiveTimeout = const Duration(seconds: 10),
    Duration? sendTimeout = const Duration(seconds: 10),
    List<Interceptor>? interceptors,
  }) {
    final Dio newDio = Dio(
      BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );

    if (interceptors != null) {
      newDio.interceptors.addAll(interceptors);
    }

    _dio = newDio;
  }

  late final Dio _dio;

  Dio get dio => _dio;

  Dio _getDioWithHeaders(Map<String, dynamic>? headers) {
    _dio.options.headers = {}; // reset headers
    if (headers != null) {
      for (final MapEntry<String, dynamic> entry in headers.entries) {
        _dio.options.headers[entry.key] = entry.value;
      }
    }
    return _dio;
  }

  @override
  FutureOr<Response<T>> httpGet<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _getDioWithHeaders(headers)
          .get<T>(url, queryParameters: queryParameters, data: data);

  @override
  FutureOr<Response<T>> httpPost<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _getDioWithHeaders(headers)
          .post<T>(url, queryParameters: queryParameters, data: data);

  @override
  FutureOr<Response<T>> httpPut<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _getDioWithHeaders(headers)
          .put<T>(url, queryParameters: queryParameters, data: data);

  @override
  FutureOr<Response<T>> httpDelete<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _getDioWithHeaders(headers)
          .delete<T>(url, queryParameters: queryParameters, data: data);
}
