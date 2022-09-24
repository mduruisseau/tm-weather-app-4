import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_hour.dart';

part 'weather_hourly.g.dart';

@JsonSerializable()
class WeatherHourly {
  final List<String> time;

  @JsonKey(name: 'weathercode')
  final List<double?> weatherCode;

  @JsonKey(name: 'temperature_2m')
  final List<double?> temperature2m;

  @JsonKey(name: 'apparent_temperature')
  final List<double?> apparentTemperature;

  final List<double?> rain;

  @JsonKey(name: 'windspeed_10m')
  final List<double?> windSpeed10m;

  @JsonKey(name: 'winddirection_10m')
  final List<double?> windDirection10m;

  WeatherHourly({
    required this.time,
    required this.weatherCode,
    required this.temperature2m,
    required this.apparentTemperature,
    required this.rain,
    required this.windSpeed10m,
    required this.windDirection10m,
  });

  List<WeatherHour> getHours() {
    List<WeatherHour> hours = [];
    for (int i = 0; i < time.length; i++) {
      if (temperature2m[i] == null || apparentTemperature[i] == null) {
        continue;
      }

      hours.add(WeatherHour(
        time: time[i],
        weatherCode: weatherCode[i] ?? 0,
        temperature2m: temperature2m[i] ?? 0,
        apparentTemperature: apparentTemperature[i] ?? 0,
        rain: rain[i] ?? 0,
        windSpeed10m: windSpeed10m[i] ?? 0,
        windDirection10m: windDirection10m[i] ?? 0,
      ));
    }

    return hours;
  }

  List<WeatherHour> getDay({required String day}) {
    List<WeatherHour> hours = getHours();
    hours = hours
        .where((element) =>
            DateFormat("yyyy-MM-dd").format(element.datetime) == day)
        .toList();

    return hours;
  }

  factory WeatherHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherHourlyToJson(this);
}
