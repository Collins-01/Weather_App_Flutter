import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double lattitude;
  final double longitude;
  final String description;
  final String main;
  final double temprature;
  final int humidity;
  final double windSpeed;
  final String name;
  const Weather(
      {required this.description,
      required this.humidity,
      required this.lattitude,
      required this.longitude,
      required this.main,
      required this.temprature,
      required this.name,
      required this.windSpeed});

  static const empty = Weather(
    temprature: 0,
    main: '',
    longitude: 0.0,
    description: '',
    humidity: 0,
    windSpeed: 0.0,
    name: '__',
    lattitude: 0.0,
  );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        temprature: json['main']['temp'],
        lattitude: json['coord']['lat'],
        longitude: json['coord']['lon'],
        main: json['weather'][0]['main'],
        windSpeed: json['wind']['speed'],
        name: json['name'],
      );
  Map<String, dynamic> toJson() => {
        'description': description,
        'temprature': temprature,
        'humidity': humidity,
        'lattitude': lattitude,
        'longitude': longitude,
        'main': main,
        'windSpeed': windSpeed,
        'name': name,
      };

  Weather copyWith({
    String? description,
    double? temprature,
    int? humidity,
    double? lattitude,
    double? longitude,
    String? main,
    double? windSpeed,
    String? name,
  }) {
    return Weather(
      description: description ?? this.description,
      humidity: humidity ?? this.humidity,
      lattitude: lattitude ?? this.lattitude,
      longitude: longitude ?? this.longitude,
      main: main ?? this.main,
      temprature: temprature ?? this.temprature,
      windSpeed: windSpeed ?? this.windSpeed,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        longitude,
        main,
        description,
        lattitude,
        temprature,
        humidity,
        windSpeed,
        name,
      ];
}

/*
  {
flutter: ║         coord: {lon: 7.4898, lat: 9.0574},
flutter: ║         weather: [{id: 500, main: Rain, description: light rain, icon: 10d}]
flutter: ║         base: "stations",
flutter: ║         main: {
flutter: ║             temp: 302.23,
flutter: ║             feels_like: 305.68,
flutter: ║             temp_min: 302.23,
flutter: ║             temp_max: 302.23,
flutter: ║             pressure: 1013,
flutter: ║             humidity: 68,
flutter: ║             sea_level: 1013,
flutter: ║             grnd_level: 959
flutter: ║        }
flutter: ║         visibility: 10000,
flutter: ║         wind: {speed: 1.78, deg: 212, gust: 2.02},
flutter: ║         rain: {1h: 0.18},
flutter: ║         clouds: {all: 100},
flutter: ║         dt: 1657286577,
flutter: ║         sys: {type: 1, id: 1173, country: NG, sunrise: 1657257366, sunset: 1657302820},
flutter: ║         timezone: 3600,
flutter: ║         id: 2352778,
flutter: ║         name: "Abuja",
flutter: ║         cod: 200
flutter: ║    }
*/