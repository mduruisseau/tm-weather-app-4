import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureInjector({
  String? env,
}) async =>
    getIt.init(
      environment: env,
    );
