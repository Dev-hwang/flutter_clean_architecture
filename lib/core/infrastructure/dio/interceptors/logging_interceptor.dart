import 'package:dio/dio.dart';

import '../../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final StringBuffer messageBuilder = StringBuffer();
    messageBuilder.write("====================================\n");
    messageBuilder.write("LoggingInterceptor::onRequest\n");
    messageBuilder.write("url: ${options.path}\n");
    messageBuilder.write("headers: ${options.headers}\n");
    messageBuilder.write("queryParameters: ${options.queryParameters}\n");
    messageBuilder.write("data: ${options.data}\n");
    messageBuilder.write("====================================\n");
    Logger.debug(messageBuilder.toString());
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final StringBuffer messageBuilder = StringBuffer();
    messageBuilder.write("====================================\n");
    messageBuilder.write("LoggingInterceptor::onResponse\n");
    messageBuilder.write("url: ${response.requestOptions.path}\n");
    messageBuilder.write("statusCode: ${response.statusCode}\n");
    messageBuilder.write("data: ${response.data}\n");
    messageBuilder.write("====================================\n");
    Logger.debug(messageBuilder.toString());
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final StringBuffer messageBuilder = StringBuffer();
    messageBuilder.write("====================================\n");
    messageBuilder.write("LoggingInterceptor::onError\n");
    messageBuilder.write("url: ${err.requestOptions.path}\n");
    messageBuilder.write("statusCode: ${err.response?.statusCode}\n");
    messageBuilder.write("data: ${err.response?.data}\n");
    messageBuilder.write("error: ${err.toString()}\n");
    messageBuilder.write("====================================\n");
    Logger.error(messageBuilder.toString());
    return handler.next(err);
  }
}
