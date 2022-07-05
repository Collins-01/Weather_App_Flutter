import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/core/models/weather_model.dart';

enum HomeStatus { loading, failure, success, initial }

extension HomeStatusX on HomeStatus {
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
  bool get isInitial => this == HomeStatus.initial;
  HomeStatus toStatus(String value) {
    switch (value) {
      case 'loading':
        return HomeStatus.loading;
      case 'initial':
        return HomeStatus.initial;
      case 'failure':
        return HomeStatus.failure;
      case 'success':
        return HomeStatus.failure;
      default:
        return HomeStatus.initial;
    }
  }
}

class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.initial,
      Weather? weather,
      this.errorMessage = ''})
      : weather = weather ?? Weather.empty;
  final HomeStatus status;
  final Weather weather;
  final String errorMessage;
  @override
  List<Object?> get props => [weather, status];

  Map<String, dynamic> toJson() => {
        'status': status.name,
        'weather': weather.toJson(),
      };

  HomeState copyWith(
      {HomeStatus? status, Weather? weather, String? errorMessage}) {
    return HomeState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory HomeState.fromJson(Map<String, dynamic> json) => HomeState(
        status: json['status'],
        weather: Weather.fromJson(
          json['weather'],
        ),
      );
}
