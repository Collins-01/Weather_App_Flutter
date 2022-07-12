import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:network_client/network_client.dart';
import 'package:weather_app_flutter/core/models/weather_model.dart';
import 'package:weather_app_flutter/core/services/weather_service.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final WeatherService _weatherService;
  HomeCubit({WeatherService? service})
      : _weatherService = service ??
            WeatherService(
              networkClient: NetworkClient(),
            ),
        super(const HomeState(weather: Weather.empty));

  Future fetchWeather(String q) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      var res = await _weatherService.getWeather(q);
      emit(state.copyWith(status: HomeStatus.success, weather: res));
    } on Failure catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.message,
        ),
      );
    }
  }

  late Weather cachedWeather;

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    print("From Jsom: $json ");
    state.copyWith(status: HomeStatus.loading);
    return HomeState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    print("To Json: ${state.toMap()}");
    return state.toMap();
  }
}
