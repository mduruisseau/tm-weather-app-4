import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_4/models/weather_day.dart';
import 'package:weather_app_4/utils/utils.dart';

class DayDetailWidget extends StatefulWidget {
  final WeatherDay weatherDay;
  const DayDetailWidget({super.key, required this.weatherDay});

  @override
  State<DayDetailWidget> createState() => _DayDetailWidgetState();
}

class _DayDetailWidgetState extends State<DayDetailWidget> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat.yMMMMEEEEd().format(widget.weatherDay.day),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Image.asset(
                Utils.weatherCodeToImage(widget.weatherDay.weatherCode),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Min: ${widget.weatherDay.temperature2mMin}°C",
                  ),
                  Text(
                    "Max: ${widget.weatherDay.temperature2mMax}°C",
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sunrise: ${DateFormat.Hms().format(widget.weatherDay.sunrise)}",
                  ),
                  Text(
                    "Sunset: ${DateFormat.Hms().format(widget.weatherDay.sunset)}",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
