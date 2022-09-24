part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherData weatherData;

  WeatherLoadedState({required this.weatherData});
}
