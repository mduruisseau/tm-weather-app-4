import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_daily.dart';
import 'package:weather_app_4/models/weather_day.dart';
import 'package:weather_app_4/models/weather_hourly.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final double latitude;
  final double longitude;

  final WeatherDaily daily;
  final WeatherHourly hourly;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.daily,
    required this.hourly,
  });

  WeatherDay getDayByIndex({required int index}) {
    WeatherDay weatherDay = daily.getDayByIndex(index: index);
    weatherDay.hours = hourly.getDay(day: weatherDay.time);

    return weatherDay;
  }

  WeatherDay getDay({required String day}) {
    WeatherDay weatherDay = daily.getDay(day: day)!;
    weatherDay.hours = hourly.getDay(day: day);

    return weatherDay;
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
