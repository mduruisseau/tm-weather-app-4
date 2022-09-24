import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_air_hour_quality.g.dart';

@JsonSerializable()
class WeatherAirHourQuality extends Equatable {
  final String time;

  final double pm10;

  @JsonKey(name: 'pm2_5')
  final double pm25;

  @JsonKey(name: 'carbon_monoxide')
  final double carbonMonoxide;

  @JsonKey(name: 'nitrogen_dioxide')
  final double nitrogenDioxide;

  @JsonKey(name: 'sulphur_dioxide')
  final double sulphurDioxide;

  final double ozone;

  @JsonKey(name: 'aerosol_optical_depth')
  final double aerosolOpticalDepth;

  final double dust;

  @JsonKey(name: 'uv_index')
  final double uvIndex;

  @JsonKey(name: 'uv_index_clear_sky')
  final double uvIndexClearSky;

  final double ammonia;

  @JsonKey(name: 'european_aqi')
  final double europeanAqi;

  @JsonKey(name: 'european_aqi_pm2_5')
  final double europeanAqiPm25;

  @JsonKey(name: 'european_aqi_pm10')
  final double europeanAqiPm10;

  @JsonKey(name: 'european_aqi_no2')
  final double europeanAqiNo2;

  @JsonKey(name: 'european_aqi_o3')
  final double europeanAqiO3;

  @JsonKey(name: 'european_aqi_so2')
  final double europeanAqiSo2;

  DateTime get datetime => DateTime.parse(time);

  WeatherAirHourQuality({
    required this.time,
    required this.pm10,
    required this.pm25,
    required this.carbonMonoxide,
    required this.nitrogenDioxide,
    required this.sulphurDioxide,
    required this.ozone,
    required this.aerosolOpticalDepth,
    required this.dust,
    required this.uvIndex,
    required this.uvIndexClearSky,
    required this.ammonia,
    required this.europeanAqi,
    required this.europeanAqiPm25,
    required this.europeanAqiPm10,
    required this.europeanAqiNo2,
    required this.europeanAqiO3,
    required this.europeanAqiSo2,
  });

  factory WeatherAirHourQuality.fromJson(Map<String, dynamic> json) =>
      _$WeatherAirHourQualityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherAirHourQualityToJson(this);

  @override
  List<Object?> get props => [
        time,
        pm10,
        pm25,
        carbonMonoxide,
        nitrogenDioxide,
        sulphurDioxide,
        ozone,
        aerosolOpticalDepth,
        dust,
        uvIndex,
        uvIndexClearSky,
        ammonia,
        europeanAqi,
        europeanAqiPm25,
        europeanAqiPm10,
        europeanAqiNo2,
        europeanAqiO3,
        europeanAqiSo2,
      ];
}
