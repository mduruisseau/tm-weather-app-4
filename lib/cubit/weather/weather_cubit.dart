import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app_4/di/injector.dart';
import 'package:weather_app_4/models/weather_data.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  refresh() async {
    emit(WeatherLoadingState());

    Dio dio = getIt<Dio>();

    await Future.delayed(const Duration(seconds: 2));

    var response = await dio.get(
      "/forecast",
      queryParameters: {
        'latitude': 52.52,
        'longitude': 13.41,
        'daily': [
          'weathercode',
          'temperature_2m_max',
          'temperature_2m_min',
          'sunrise',
          'sunset'
        ],
        'timezone': 'Europe/Paris',
        'start_date': Jiffy().startOf(Units.MONTH).format('yyyy-MM-dd'),
        'end_date': Jiffy().add(days: 7).format('yyyy-MM-dd'),
      },
    );

    WeatherData weatherData = WeatherData.fromJson(response.data);

    emit(WeatherLoadedState(weatherData: weatherData));
  }

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
