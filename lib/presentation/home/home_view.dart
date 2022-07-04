import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/repositories/repositories.dart';
import 'package:weather_app_flutter/core/services/weather_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(onPressed: () {
        WeatherService().getWeather('China');
      }),
    );
  }
}
