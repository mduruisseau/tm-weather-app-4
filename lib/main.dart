import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:weather_app_4/di/injector.dart';
import 'package:weather_app_4/views/weather_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initIntlAndLocale();

  await dotenv.load();

  // Initialize dependency injection.
  await configureInjector(getIt, env: Environment.prod);
  runApp(const MyApp());
}

Future<void> initIntlAndLocale() async {
  Intl.defaultLocale = 'fr_FR';
  await findSystemLocale();
  await initializeDateFormatting(Intl.defaultLocale!, null);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('fr', 'FR'),
      home: const WeatherHome(),
    );
  }
}
