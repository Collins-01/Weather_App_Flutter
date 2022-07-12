import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/models/weather_model.dart';
import 'package:weather_app_flutter/presentation/home/components/weather_info.dart';

class BuildWeatherContent extends StatelessWidget {
  final Weather weather;
  const BuildWeatherContent({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.humidity.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            height: 2,
            letterSpacing: 0.8,
            // fontStyle: FontStyle.normal,
          ),
        ),
        Text(weather.name),
        const Spacer(),
        Text(weather.main),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfo(
              detail: weather.temprature.toString(),
              title: "Temprature",
            ),
            WeatherInfo(
              detail: weather.windSpeed.toString(),
              title: "Wind",
            ),
            WeatherInfo(
              detail: weather.humidity.toString(),
              title: "Pressure",
            ),
          ],
        ),
        const Spacer(),
        Text(weather.description),
        const Spacer(),
      ],
    );
  }
}
