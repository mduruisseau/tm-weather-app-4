// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) =>
    WeatherHourly(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      weatherCode: (json['weathercode'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      apparentTemperature: (json['apparent_temperature'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      rain: (json['rain'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      windSpeed10m: (json['windspeed_10m'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection10m: (json['winddirection_10m'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weatherCode,
      'temperature_2m': instance.temperature2m,
      'apparent_temperature': instance.apparentTemperature,
      'rain': instance.rain,
      'windspeed_10m': instance.windSpeed10m,
      'winddirection_10m': instance.windDirection10m,
    };
