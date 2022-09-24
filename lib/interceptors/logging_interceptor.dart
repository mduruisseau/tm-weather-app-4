import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  final Logger logger;
  late int requestTimestamp;
  late int responseTimestamp;

  LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    requestTimestamp = DateTime.now().millisecondsSinceEpoch;

    logger.i(
      '''
    --> ${options.method.toUpperCase()} ${(options.baseUrl) + (options.path)}
    Headers:
    ${options.headers}
    QueryParameters:
    ${options.queryParameters}
    Body: 
    ${options.data ?? ""}
    ''',
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final path = response.requestOptions.baseUrl + response.requestOptions.path;
    responseTimestamp = DateTime.now().millisecondsSinceEpoch;

    logger.i(
      '''
    <-- ${response.statusCode} $path}
    Headers:
    ${response.headers}
    Response:
    ${response.data}
    ''',
    );

    _logQueryDuration(path);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String path;
    path = err.response?.requestOptions != null
        ? (err.response!.requestOptions.baseUrl +
            err.response!.requestOptions.path)
        : 'URL';
    responseTimestamp = DateTime.now().millisecondsSinceEpoch;

    logger.e(
      '''
    <-- ${err.message} $path}
    ${err.response != null ? err.response?.data : 'Unknown Error'}
    ''',
    );

    _logQueryDuration(path);

    super.onError(err, handler);
  }

  void _logQueryDuration(String path) {
    logger.d('$path\n>>> ${responseTimestamp - requestTimestamp} ms');
  }
}
