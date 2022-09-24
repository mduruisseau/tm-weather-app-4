import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_daily.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final double latitude;
  final double longitude;

  final WeatherDaily daily;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
