import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_4/config/constants.dart';
import 'package:weather_app_4/interceptors/logging_interceptor.dart';

@module
abstract class HttpModule {
  @prod
  @Named(kProdBaseUrl)
  String provideProdBaseUrl() => dotenv.get(kProdBaseUrl, fallback: '');

  @prod
  @lazySingleton
  BaseOptions provideProdBaseOptions(
    @Named(kProdBaseUrl) String url,
  ) =>
      BaseOptions(
        contentType: 'application/json',
        //baseUrl: url,
      );

  @lazySingleton
  LoggingInterceptor provideLoggingInterceptors(Logger logger) =>
      LoggingInterceptor(logger);

  @lazySingleton
  Dio dio(
    BaseOptions options,
    LoggingInterceptor loggingInterceptor,
  ) =>
      Dio(options)..interceptors.add(loggingInterceptor);
}
