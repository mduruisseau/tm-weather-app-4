// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAirQuality _$WeatherAirQualityFromJson(Map<String, dynamic> json) =>
    WeatherAirQuality(
      hourly: WeatherAirHourlyQuality.fromJson(
          json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherAirQualityToJson(WeatherAirQuality instance) =>
    <String, dynamic>{
      'hourly': instance.hourly,
    };
