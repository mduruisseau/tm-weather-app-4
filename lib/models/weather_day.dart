import 'package:equatable/equatable.dart';

class WeatherDay extends Equatable {
  final String time;

  final double weatherCode;

  final double temperature2mMin;
  final double temperature2mMax;

  final DateTime sunrise;
  final DateTime sunset;

  const WeatherDay({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMin,
    required this.temperature2mMax,
    required this.sunrise,
    required this.sunset,
  });

  DateTime get day => DateTime.parse(time);

  @override
  List<Object?> get props => [
        time,
        weatherCode,
        temperature2mMin,
        temperature2mMax,
        sunrise,
        sunset,
      ];
}
