import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:weather_app_4/cubit/weather/weather_cubit.dart';
import 'package:weather_app_4/cubit/weather_day/weather_day_cubit.dart';
import 'package:weather_app_4/di/injector.dart';
import 'package:weather_app_4/views/weather_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initIntlAndLocale();

  await dotenv.load();

  // Initialize dependency injection.
  await configureInjector(env: Environment.prod);
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
      title: 'Weather App 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('fr', 'FR'),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(),
          ),
          BlocProvider(
            create: (context) => WeatherDayCubit(),
          ),
        ],
        child: const WeatherHome(),
      ),
    );
  }
}
