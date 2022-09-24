import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_4/cubit/weather_day/weather_day_cubit.dart';
import 'package:weather_app_4/models/weather_day.dart';
import 'package:weather_app_4/utils/utils.dart';

class DayWeatherWidget extends StatelessWidget {
  final WeatherDay weatherDay;

  const DayWeatherWidget({
    Key? key,
    required this.weatherDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                DateFormat.EEEE().add_d().format(weatherDay.day),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Utils.weatherCodeToImage(weatherDay.weatherCode),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        context.read<WeatherDayCubit>().setWeatherDay(weatherDay);
      },
    );
  }
}
