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
    final isToday = DateFormat.yMd().format(weatherDay.day) ==
        DateFormat.yMd().format(DateTime.now());
    final dateText = isToday
        ? "Aujourd'hui"
        : DateFormat.EEEE().add_d().format(weatherDay.day);

    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              titleRow(isToday, dateText, context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'weatherImage${weatherDay.day}',
                    child: Image.asset(
                      Utils.weatherCodeToImage(weatherDay.weatherCode),
                    ),
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

  Widget titleRow(bool isToday, String dateText, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isToday) ...{
          const Icon(
            Icons.today,
            size: 16,
          ),
          const SizedBox(width: 4),
        },
        Text(
          dateText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
