import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_day.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {
  final List<String> time;

  @JsonKey(name: 'weathercode')
  final List<double> weatherCode;

  @JsonKey(name: 'temperature_2m_min')
  final List<double> temperature2mMin;

  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperature2mMax;

  final List<DateTime> sunrise;
  final List<DateTime> sunset;

  WeatherDaily({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMin,
    required this.temperature2mMax,
    required this.sunrise,
    required this.sunset,
  });

  WeatherDay getDayByIndex({required int index}) {
    return WeatherDay(
      time: time[index],
      weatherCode: weatherCode[index],
      temperature2mMin: temperature2mMin[index],
      temperature2mMax: temperature2mMax[index],
      sunrise: sunrise[index],
      sunset: sunset[index],
    );
  }

  WeatherDay? getDay({required String day}) {
    int index = time.indexWhere((element) => element == day);
    if (index == -1) {
      return null;
    }

    return getDayByIndex(index: index);
  }

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherDailyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);
}
