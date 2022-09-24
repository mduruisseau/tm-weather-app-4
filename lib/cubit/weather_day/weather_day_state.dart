part of 'weather_day_cubit.dart';

abstract class WeatherDayState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherDayInitialState extends WeatherDayState {}

class WeatherDayLoadedState extends WeatherDayState {
  final WeatherDay weatherDay;

  WeatherDayLoadedState({required this.weatherDay});

  @override
  List<Object?> get props => [weatherDay];
}
