import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_4/models/weather_air_hour_quality.dart';

part 'weather_air_hourly_quality.g.dart';

@JsonSerializable()
class WeatherAirHourlyQuality extends Equatable {
  final List<String> time;

  final List<double> pm10;

  @JsonKey(name: 'pm2_5')
  final List<double> pm25;

  @JsonKey(name: 'carbon_monoxide')
  final List<double> carbonMonoxide;

  @JsonKey(name: 'nitrogen_dioxide')
  final List<double> nitrogenDioxide;

  @JsonKey(name: 'sulphur_dioxide')
  final List<double> sulphurDioxide;

  final List<double> ozone;

  @JsonKey(name: 'aerosol_optical_depth')
  final List<double> aerosolOpticalDepth;

  final List<double> dust;

  @JsonKey(name: 'uv_index')
  final List<double> uvIndex;

  @JsonKey(name: 'uv_index_clear_sky')
  final List<double> uvIndexClearSky;

  final List<double> ammonia;

  @JsonKey(name: 'european_aqi')
  final List<double> europeanAqi;

  @JsonKey(name: 'european_aqi_pm2_5')
  final List<double> europeanAqiPm25;

  @JsonKey(name: 'european_aqi_pm10')
  final List<double> europeanAqiPm10;

  @JsonKey(name: 'european_aqi_no2')
  final List<double> europeanAqiNo2;

  @JsonKey(name: 'european_aqi_o3')
  final List<double> europeanAqiO3;

  @JsonKey(name: 'european_aqi_so2')
  final List<double> europeanAqiSo2;

  WeatherAirHourlyQuality({
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

  List<WeatherAirHourQuality> getHours() {
    List<WeatherAirHourQuality> hours = [];
    for (int i = 0; i < time.length; i++) {
      hours.add(WeatherAirHourQuality(
        time: time[i],
        pm10: pm10[i],
        pm25: pm25[i],
        carbonMonoxide: carbonMonoxide[i],
        nitrogenDioxide: nitrogenDioxide[i],
        sulphurDioxide: sulphurDioxide[i],
        ozone: ozone[i],
        aerosolOpticalDepth: aerosolOpticalDepth[i],
        dust: dust[i],
        uvIndex: uvIndex[i],
        uvIndexClearSky: uvIndexClearSky[i],
        ammonia: ammonia[i],
        europeanAqi: europeanAqi[i],
        europeanAqiPm25: europeanAqiPm25[i],
        europeanAqiPm10: europeanAqiPm10[i],
        europeanAqiNo2: europeanAqiNo2[i],
        europeanAqiO3: europeanAqiO3[i],
        europeanAqiSo2: europeanAqiSo2[i],
      ));
    }

    return hours;
  }

  double get meanPm10 =>
      pm10.fold(0.0, (previousValue, element) => previousValue + element) /
      pm10.length;

  double get meanPm25 =>
      pm25.fold(0.0, (previousValue, element) => previousValue + element) /
      pm25.length;

  double get meanCarbonMonoxide =>
      carbonMonoxide.fold(
          0.0, (previousValue, element) => previousValue + element) /
      carbonMonoxide.length;

  double get meanNitrogenDioxide =>
      nitrogenDioxide.fold(
          0.0, (previousValue, element) => previousValue + element) /
      nitrogenDioxide.length;

  double get meanSulphurDioxide =>
      sulphurDioxide.fold(
          0.0, (previousValue, element) => previousValue + element) /
      sulphurDioxide.length;

  double get meanOzone =>
      ozone.fold(0.0, (previousValue, element) => previousValue + element) /
      ozone.length;

  double get meanAerosolOpticalDepth =>
      aerosolOpticalDepth.fold(
          0.0, (previousValue, element) => previousValue + element) /
      aerosolOpticalDepth.length;

  double get meanDust =>
      dust.fold(0.0, (previousValue, element) => previousValue + element) /
      dust.length;

  double get meanUvIndex =>
      uvIndex.fold(0.0, (previousValue, element) => previousValue + element) /
      uvIndex.length;

  double get meanUvIndexClearSky =>
      uvIndexClearSky.fold(
          0.0, (previousValue, element) => previousValue + element) /
      uvIndexClearSky.length;

  double get meanAmmonia =>
      ammonia.fold(0.0, (previousValue, element) => previousValue + element) /
      ammonia.length;

  double get meanEuropeanAqi =>
      europeanAqi.fold(
          0.0, (previousValue, element) => previousValue + element) /
      europeanAqi.length;

  double get meanEuropeanAqiPm25 =>
      europeanAqiPm25.fold(
          0.0, (previousValue, element) => previousValue + element) /
      europeanAqiPm25.length;

  double get meanEuropeanAqiPm10 =>
      europeanAqiPm10.fold(
          0.0, (previousValue, element) => previousValue + element) /
      europeanAqiPm10.length;

  double get meanEuropeanAqiNo2 =>
      europeanAqiNo2.fold(
          0.0, (previousValue, element) => previousValue + element) /
      europeanAqiNo2.length;

  double get meanEuropeanAqiO3 =>
      europeanAqiO3.fold(
          0.0, (previousValue, element) => previousValue + element) /
      europeanAqiO3.length;

  factory WeatherAirHourlyQuality.fromJson(Map<String, dynamic> json) =>
      _$WeatherAirHourlyQualityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherAirHourlyQualityToJson(this);

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
