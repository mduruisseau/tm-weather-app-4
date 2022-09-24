import 'package:equatable/equatable.dart';
import 'package:weather_app_4/models/weather_air_hour_quality.dart';

class WeatherHour extends Equatable {
  final String time;

  final double weatherCode;

  final double temperature2m;

  final double apparentTemperature;

  final double rain;

  final double windSpeed10m;

  final double windDirection10m;

  WeatherAirHourQuality? airQuality;

  DateTime get datetime => DateTime.parse(time);

  WeatherHour({
    required this.time,
    required this.weatherCode,
    required this.temperature2m,
    required this.apparentTemperature,
    required this.rain,
    required this.windSpeed10m,
    required this.windDirection10m,
    this.airQuality,
  });

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        temperature2m,
        apparentTemperature,
        rain,
        windSpeed10m,
        windDirection10m,
        airQuality,
      ];
}
