class Weather {
  final double lattitude;
  final double longitude;
  final String description;
  final String main;
  final double temprature;
  final int humidity;
  Weather({
    this.description = '',
    this.humidity = 0,
    this.lattitude = 0.0,
    this.longitude = 0.0,
    this.main = '',
    this.temprature = 0,
  });

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
}
