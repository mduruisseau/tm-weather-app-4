import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_4/cubit/weather/weather_cubit.dart';
import 'package:weather_app_4/cubit/weather_day/weather_day_cubit.dart';
import 'package:weather_app_4/views/day_detail_widget.dart';
import 'package:weather_app_4/views/day_weather_widget.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherDayCubit = context.read<WeatherDayCubit>();
    return BlocListener<WeatherDayCubit, WeatherDayState>(
      listener: (context, state) {
        if (state is WeatherDayLoadedState && !state.hasAirQualityData) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Jour sélectionné: ${DateFormat.yMd().format(state.weatherDay.day)}",
              ),
              closeIconColor: Colors.white,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
            ),
          );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DayDetailWidget(
                weatherDayCubit: weatherDayCubit,
              ),
            ),
          );
        }
      },
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Météo'),
            ),
            body: SafeArea(child: _buildBody(context, state)),
            backgroundColor: Colors.white,
            persistentFooterButtons: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context).refresh();
                  BlocProvider.of<WeatherDayCubit>(context).clear();
                },
                child: const Center(child: Text("Refresh")),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, WeatherState state) {
    if (state is WeatherLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is WeatherLoadedState) {
      int crossAxisCount = max(
        1,
        (MediaQuery.of(context).size.width / 200).round(),
      );

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                itemCount: state.weatherData.daily.time.length,
                itemBuilder: (context, index) => DayWeatherWidget(
                  weatherDay: state.weatherData.getDayByIndex(index: index),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: ElevatedButton(
        onPressed: () => BlocProvider.of<WeatherCubit>(context).refresh(),
        child: const Text("Charger la météo"),
      ),
    );
  }
}
