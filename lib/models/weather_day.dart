import 'package:equatable/equatable.dart';
import 'package:weather_app_4/models/weather_air_hour_quality.dart';
import 'package:weather_app_4/models/weather_air_hourly_quality.dart';
import 'package:weather_app_4/models/weather_hour.dart';

class WeatherDay extends Equatable {
  final String time;

  final double weatherCode;

  final double temperature2mMin;
  final double temperature2mMax;

  final DateTime sunrise;
  final DateTime sunset;

  DateTime updatedAt = DateTime.now();

  List<WeatherHour> hours = [];
  WeatherAirHourlyQuality? airHours;
  List<WeatherAirHourQuality> airQuality = [];

  WeatherDay({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMin,
    required this.temperature2mMax,
    required this.sunrise,
    required this.sunset,
  });

  DateTime get day => DateTime.parse(time);

  bool get hasAirQualityData =>
      hours.any((element) => element.airQuality != null);

  void linkAirQuality(WeatherAirHourlyQuality airQuality) {
    airHours = airQuality;
    this.airQuality = airQuality.getHours();

    for (WeatherHour hour in hours) {
      var hourAirQuality = this.airQuality.where(
            (element) => element.datetime == hour.datetime,
          );

      if (hourAirQuality.isNotEmpty) {
        hour.airQuality = hourAirQuality.first;
      }
    }

    updatedAt = DateTime.now();
  }

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        temperature2mMin,
        temperature2mMax,
        sunrise,
        sunset,
        hours,
        airHours,
        airQuality,
        updatedAt,
      ];
}
