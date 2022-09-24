import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_4/cubit/weather_day/weather_day_cubit.dart';
import 'package:weather_app_4/models/weather_day.dart';
import 'package:weather_app_4/utils/utils.dart';
import 'package:weather_app_4/views/day_weather_air_quality_widget.dart';
import 'package:weather_app_4/views/weather_day_hours_details.dart';

class DayDetailWidget extends StatelessWidget {
  WeatherDayCubit weatherDayCubit;

  DayDetailWidget({
    super.key,
    required this.weatherDayCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: weatherDayCubit,
      child: BlocBuilder<WeatherDayCubit, WeatherDayState>(
        builder: (context, state) {
          if (state is WeatherDayInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final weatherDay = (state as WeatherDayLoadedState).weatherDay;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                DateFormat.yMMMMEEEEd().format(weatherDay.day),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...buildTopWidgets(context, weatherDay),
                    const Divider(),
                    if (state.hasAirQualityData) ...{
                      DayWeatherAirQualityWidget(
                        weatherDay: state.weatherDay,
                      ),
                    } else ...{
                      const CircularProgressIndicator(),
                    },
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildTopWidgets(BuildContext context, WeatherDay weatherDay) {
    return [
      Hero(
        tag: 'weatherImage${weatherDay.day}',
        child: Image.asset(
          Utils.weatherCodeToImage(weatherDay.weatherCode),
          height: 300,
        ),
      ),
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Min: ${weatherDay.temperature2mMin}°C",
          ),
          Text(
            "Max: ${weatherDay.temperature2mMax}°C",
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sunrise: ${DateFormat.Hms().format(weatherDay.sunrise)}",
          ),
          Text(
            "Sunset: ${DateFormat.Hms().format(weatherDay.sunset)}",
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Heures",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDay.hours.length,
            itemBuilder: (context, index) => WeatherDayHoursDetails(
              hour: weatherDay.hours[index],
            ),
          ),
        ),
      ),
    ];
  }
}
