// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:weather_app_4/di/core_module.dart' as _i8;
import 'package:weather_app_4/di/http_module.dart' as _i9;
import 'package:weather_app_4/interceptors/logging_interceptor.dart' as _i6;
import 'package:weather_app_4/logger/developer_log_printer.dart' as _i3;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    final httpModule = _$HttpModule();
    gh.singleton<_i3.DeveloperLogPrinter>(
        coreModule.provideDeveloperLogPrinter());
    gh.factory<_i4.Key>(() => coreModule.provideKey());
    gh.singleton<_i5.Logger>(
        coreModule.provideLogger(gh<_i3.DeveloperLogPrinter>()));
    gh.lazySingleton<_i6.LoggingInterceptor>(
        () => httpModule.provideLoggingInterceptors(gh<_i5.Logger>()));
    gh.factory<String>(
      () => httpModule.provideProdBaseUrl(),
      instanceName: 'PROD',
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.BaseOptions>(
      () => httpModule.provideProdBaseOptions(gh<String>(instanceName: 'PROD')),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.Dio>(() => httpModule.dio(
          gh<_i7.BaseOptions>(),
          gh<_i6.LoggingInterceptor>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i8.CoreModule {}

class _$HttpModule extends _i9.HttpModule {}
