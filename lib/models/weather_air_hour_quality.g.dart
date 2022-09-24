// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_air_hour_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAirHourQuality _$WeatherAirHourQualityFromJson(
        Map<String, dynamic> json) =>
    WeatherAirHourQuality(
      time: json['time'] as String,
      pm10: (json['pm10'] as num).toDouble(),
      pm25: (json['pm2_5'] as num).toDouble(),
      carbonMonoxide: (json['carbon_monoxide'] as num).toDouble(),
      nitrogenDioxide: (json['nitrogen_dioxide'] as num).toDouble(),
      sulphurDioxide: (json['sulphur_dioxide'] as num).toDouble(),
      ozone: (json['ozone'] as num).toDouble(),
      aerosolOpticalDepth: (json['aerosol_optical_depth'] as num).toDouble(),
      dust: (json['dust'] as num).toDouble(),
      uvIndex: (json['uv_index'] as num).toDouble(),
      uvIndexClearSky: (json['uv_index_clear_sky'] as num).toDouble(),
      ammonia: (json['ammonia'] as num).toDouble(),
      europeanAqi: (json['european_aqi'] as num).toDouble(),
      europeanAqiPm25: (json['european_aqi_pm2_5'] as num).toDouble(),
      europeanAqiPm10: (json['european_aqi_pm10'] as num).toDouble(),
      europeanAqiNo2: (json['european_aqi_no2'] as num).toDouble(),
      europeanAqiO3: (json['european_aqi_o3'] as num).toDouble(),
      europeanAqiSo2: (json['european_aqi_so2'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherAirHourQualityToJson(
        WeatherAirHourQuality instance) =>
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
