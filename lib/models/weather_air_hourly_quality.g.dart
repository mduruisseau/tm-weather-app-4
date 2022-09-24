// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_air_hourly_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAirHourlyQuality _$WeatherAirHourlyQualityFromJson(
        Map<String, dynamic> json) =>
    WeatherAirHourlyQuality(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      pm10: (json['pm10'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      pm25: (json['pm2_5'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      carbonMonoxide: (json['carbon_monoxide'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      nitrogenDioxide: (json['nitrogen_dioxide'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      sulphurDioxide: (json['sulphur_dioxide'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      ozone: (json['ozone'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      aerosolOpticalDepth: (json['aerosol_optical_depth'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      dust: (json['dust'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      uvIndex: (json['uv_index'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      uvIndexClearSky: (json['uv_index_clear_sky'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      ammonia: (json['ammonia'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqi: (json['european_aqi'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqiPm25: (json['european_aqi_pm2_5'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqiPm10: (json['european_aqi_pm10'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqiNo2: (json['european_aqi_no2'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqiO3: (json['european_aqi_o3'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      europeanAqiSo2: (json['european_aqi_so2'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$WeatherAirHourlyQualityToJson(
        WeatherAirHourlyQuality instance) =>
    <String, dynamic>{
      'time': instance.time,
      'pm10': instance.pm10,
      'pm2_5': instance.pm25,
      'carbon_monoxide': instance.carbonMonoxide,
      'nitrogen_dioxide': instance.nitrogenDioxide,
      'sulphur_dioxide': instance.sulphurDioxide,
      'ozone': instance.ozone,
      'aerosol_optical_depth': instance.aerosolOpticalDepth,
      'dust': instance.dust,
      'uv_index': instance.uvIndex,
      'uv_index_clear_sky': instance.uvIndexClearSky,
      'ammonia': instance.ammonia,
      'european_aqi': instance.europeanAqi,
      'european_aqi_pm2_5': instance.europeanAqiPm25,
      'european_aqi_pm10': instance.europeanAqiPm10,
      'european_aqi_no2': instance.europeanAqiNo2,
      'european_aqi_o3': instance.europeanAqiO3,
      'european_aqi_so2': instance.europeanAqiSo2,
    };
