import 'package:flutter/material.dart';
import 'package:weather_app_4/models/weather_day.dart';

class DayWeatherAirQualityWidget extends StatelessWidget {
  final WeatherDay weatherDay;

  const DayWeatherAirQualityWidget({
    super.key,
    required this.weatherDay,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 18,
        );

    return Column(
      children: [
        Text(
          "Air Quality",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Text('Carbon monoxide: '),
            Text(
              "${weatherDay.airHours!.meanCarbonMonoxide.toStringAsFixed(2)} μg/m3",
              style: style,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Nitrogen monoxide: '),
            Text(
              "${weatherDay.airHours!.meanNitrogenDioxide.toStringAsFixed(2)} μg/m3",
              style: style,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Dust: '),
            Text(
              "${weatherDay.airHours!.meanDust.toStringAsFixed(2)} μg/m3",
              style: style,
            ),
          ],
        ),
        Row(
          children: [
            const Text('European Aqi: '),
            Text(
              "${weatherDay.airHours!.meanEuropeanAqi.toStringAsFixed(2)} EAQI",
              style: style,
            ),
          ],
        ),
      ],
    );
  }
}
