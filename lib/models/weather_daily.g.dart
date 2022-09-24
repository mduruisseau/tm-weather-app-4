// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) => WeatherDaily(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      weatherCode: (json['weathercode'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMax: (json['temperature_2m_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      sunrise: (json['sunrise'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      sunset: (json['sunset'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weatherCode,
      'temperature_2m_min': instance.temperature2mMin,
      'temperature_2m_max': instance.temperature2mMax,
      'sunrise': instance.sunrise.map((e) => e.toIso8601String()).toList(),
      'sunset': instance.sunset.map((e) => e.toIso8601String()).toList(),
    };
