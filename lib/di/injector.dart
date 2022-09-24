import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureInjector(
  GetIt getIt, {
  String? env,
}) async =>
    $initGetIt(getIt, environment: env);
