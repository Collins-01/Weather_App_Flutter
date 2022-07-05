import 'package:network_client/network_client.dart';
import 'package:weather_app_flutter/core/models/weather_model.dart';
import 'package:weather_app_flutter/core/repositories/repositories.dart';
import 'package:weather_app_flutter/core/services/endpoints.dart';

class WeatherService extends WeatherRepository {
  WeatherService({NetworkClient? networkClient})
      : _networkClient = networkClient ?? NetworkClient();
  final NetworkClient _networkClient;
  @override
  Future<Weather> getWeather(String query) async {
    try {
      var response = await _networkClient.get(EndPoints.getWeather(query));
      final weather = Weather.fromJson(response);
      return weather;
    } on Failure {
      rethrow;
    }
  }
}
