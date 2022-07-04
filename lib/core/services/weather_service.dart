import 'package:weather_app_flutter/core/models/weather_model.dart';
import 'package:weather_app_flutter/core/repositories/repositories.dart';

class WeatherService extends WeatherRepository {
  @override
  Future<Weather> getWeather(String query) {
    throw UnimplementedError();
  }
}
