import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_4/models/weather_day.dart';

part 'weather_day_state.dart';

class WeatherDayCubit extends Cubit<WeatherDayState> {
  WeatherDayCubit() : super(WeatherDayInitialState());

  clear() {
    emit(WeatherDayInitialState());
  }

  setWeatherDay(WeatherDay weatherDay) {
    emit(WeatherDayLoadedState(weatherDay: weatherDay));
  }

  @override
  void onChange(Change<WeatherDayState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
