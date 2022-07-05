import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double lattitude;
  final double longitude;
  final String description;
  final String main;
  final double temprature;
  final int humidity;
  const Weather({
    required this.description,
    required this.humidity,
    required this.lattitude,
    required this.longitude,
    required this.main,
    required this.temprature,
  });

  static const empty = Weather(
      temprature: 0,
      main: '',
      longitude: 0.0,
      description: '',
      humidity: 0,
      lattitude: 0.0);

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        temprature: json['main']['temp'],
        lattitude: json['coord']['lat'],
        longitude: json['coord']['lon'],
        main: json['weather'][0]['main'],
      );
  Map<String, dynamic> toJson() => {
        'description': description,
        'temprature': temprature,
        'humidity': humidity,
        'lattitude': lattitude,
        'longitude': longitude,
        'main': main,
      };

  Weather copyWith({
    String? description,
    double? temprature,
    int? humidity,
    double? lattitude,
    double? longitude,
    String? main,
  }) {
    return Weather(
      description: description ?? this.description,
      humidity: humidity ?? this.humidity,
      lattitude: lattitude ?? this.lattitude,
      longitude: longitude ?? this.longitude,
      main: main ?? this.main,
      temprature: temprature ?? this.temprature,
    );
  }

  @override
  List<Object?> get props =>
      [longitude, main, description, lattitude, temprature, humidity];
}
