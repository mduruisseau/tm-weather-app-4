import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_4/di/injector.dart';
import 'package:weather_app_4/models/weather_data.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  refresh() async {
    emit(WeatherLoadingState());

    Dio dio = getIt<Dio>();

    var response = await dio.get(
      "https://api.open-meteo.com/v1/forecast",
      queryParameters: {
        'latitude': 50.630116,
        'longitude': 3.0138868,
        'daily': [
          'weathercode',
          'temperature_2m_max',
          'temperature_2m_min',
          'sunrise',
          'sunset'
        ],
        'hourly': [
          'temperature_2m',
          'apparent_temperature',
          'rain',
          'weathercode',
          'windspeed_10m',
          'winddirection_10m'
        ],
        'timezone': 'Europe/Paris',
        'start_date':
            Jiffy.now().startOf(Unit.month).format(pattern: 'yyyy-MM-dd'),
        'end_date': Jiffy.now().add(days: 15).format(pattern: 'yyyy-MM-dd'),
      },
    );

    WeatherData weatherData = WeatherData.fromJson(response.data);

    emit(WeatherLoadedState(weatherData: weatherData));
  }

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);
    getIt<Logger>().d(change.toString());
  }
}
