import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_4/models/weather_hour.dart';
import 'package:weather_app_4/utils/utils.dart';

class WeatherDayHoursDetails extends StatelessWidget {
  const WeatherDayHoursDetails({
    super.key,
    required this.hour,
  });

  final WeatherHour hour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Text(
            DateFormat.Hm().format(hour.datetime),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            Utils.weatherCodeToImage(hour.weatherCode),
            height: 35,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${hour.temperature2m}°C",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
