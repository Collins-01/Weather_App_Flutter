import 'package:weather_app_flutter/core/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String query);
}
