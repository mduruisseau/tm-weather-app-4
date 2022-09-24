// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../interceptors/logging_interceptor.dart' as _i6;
import '../logger/developer_log_printer.dart' as _i3;
import 'core_module.dart' as _i8;
import 'http_module.dart' as _i9;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final coreModule = _$CoreModule();
  final httpModule = _$HttpModule();
  gh.singleton<_i3.DeveloperLogPrinter>(
      coreModule.provideDeveloperLogPrinter());
  gh.factory<_i4.Key>(() => coreModule.provideKey());
  gh.singleton<_i5.Logger>(
      coreModule.provideLogger(get<_i3.DeveloperLogPrinter>()));
  gh.lazySingleton<_i6.LoggingInterceptor>(
      () => httpModule.provideLoggingInterceptors(get<_i5.Logger>()));
  gh.factory<String>(
    () => httpModule.provideProdBaseUrl(),
    instanceName: 'PROD',
    registerFor: {_prod},
  );
  gh.lazySingleton<_i7.BaseOptions>(
    () => httpModule.provideProdBaseOptions(get<String>(instanceName: 'PROD')),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i7.Dio>(() => httpModule.dio(
        get<_i7.BaseOptions>(),
        get<_i6.LoggingInterceptor>(),
      ));
  return get;
}

class _$CoreModule extends _i8.CoreModule {}

class _$HttpModule extends _i9.HttpModule {}
