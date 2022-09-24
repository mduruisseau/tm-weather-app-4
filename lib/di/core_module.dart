import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../logger/developer_log_printer.dart';

@module
abstract class CoreModule {
  @singleton
  DeveloperLogPrinter provideDeveloperLogPrinter() => DeveloperLogPrinter();

  @singleton
  Logger provideLogger(DeveloperLogPrinter developerLogPrinter) => Logger(
        output: developerLogPrinter,
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: false,
          printTime: true,
        ),
      );

  @factory
  Key provideKey() => UniqueKey();
}
