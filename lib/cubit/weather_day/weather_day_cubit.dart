import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_4/di/injector.dart';
import 'package:weather_app_4/models/weather_air_quality.dart';
import 'package:weather_app_4/models/weather_day.dart';

part 'weather_day_state.dart';

class WeatherDayCubit extends Cubit<WeatherDayState> {
  WeatherDayCubit() : super(WeatherDayInitialState());

  clear() {
    emit(WeatherDayInitialState());
  }

  setWeatherDay(WeatherDay weatherDay) async {
    emit(WeatherDayInitialState());
    emit(WeatherDayLoadedState(weatherDay: weatherDay));

    await Future.delayed(const Duration(seconds: 2));

    Dio dio = getIt<Dio>();

    var response = await dio.get(
      "https://air-quality-api.open-meteo.com/v1/air-quality",
      queryParameters: {
        'latitude': 50.630116,
        'longitude': 3.0138868,
        'hourly': [
          'pm10',
          'pm2_5',
          'carbon_monoxide',
          'nitrogen_dioxide',
          'sulphur_dioxide',
          'ozone',
          'aerosol_optical_depth',
          'dust',
          'uv_index',
          'uv_index_clear_sky',
          'ammonia',
          'alder_pollen',
          'birch_pollen',
          'grass_pollen',
          'mugwort_pollen',
          'olive_pollen',
          'ragweed_pollen',
          'european_aqi',
          'european_aqi_pm2_5',
          'european_aqi_pm10',
          'european_aqi_no2',
          'european_aqi_o3',
          'european_aqi_so2'
        ],
        'timezone': 'Europe/Paris',
        'start_date': weatherDay.time,
        'end_date': weatherDay.time,
      },
    );

    WeatherAirQuality airQuality = WeatherAirQuality.fromJson(response.data);
    weatherDay.linkAirQuality(airQuality.hourly);

    emit(WeatherDayLoadedState(
      weatherDay: weatherDay,
      hasAirQualityData: true,
    ));
  }

  @override
  void onChange(Change<WeatherDayState> change) {
    super.onChange(change);
    getIt<Logger>().d(change.toString());
  }
}
