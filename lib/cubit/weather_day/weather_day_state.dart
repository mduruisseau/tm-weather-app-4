part of 'weather_day_cubit.dart';

abstract class WeatherDayState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherDayInitialState extends WeatherDayState {}

class WeatherDayLoadedState extends WeatherDayState {
  final WeatherDay weatherDay;
  final bool hasAirQualityData;

  WeatherDayLoadedState({
    required this.weatherDay,
    this.hasAirQualityData = false,
  });

  @override
  List<Object?> get props => [
        weatherDay,
        hasAirQualityData,
      ];
}
