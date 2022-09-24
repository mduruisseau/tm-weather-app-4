import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_air_hourly_quality.dart';

part 'weather_air_quality.g.dart';

@JsonSerializable()
class WeatherAirQuality {
  final WeatherAirHourlyQuality hourly;

  WeatherAirQuality({
    required this.hourly,
  });

  factory WeatherAirQuality.fromJson(Map<String, dynamic> json) =>
      _$WeatherAirQualityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherAirQualityToJson(this);
}
