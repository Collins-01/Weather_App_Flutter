import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:network_client/network_client.dart';
import 'package:weather_app_flutter/core/models/weather_model.dart';
import 'package:weather_app_flutter/core/services/services.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_events.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_state.dart';

class HomeBlocTest extends HydratedBloc<HomeEvents, HomeState> {
  final WeatherService _weatherService;
  HomeBlocTest({WeatherService? weatherService, Weather? cachedWeather})
      : _weatherService = weatherService ?? WeatherService(),
        _cachedWeather = cachedWeather,
        super(const HomeState(weather: Weather.empty)) {
    on<OnHomePageLoadEvent>(_onHomePageLoadEvent);
    on<HomePageSearchEvent>(_onHomePageSearchEvent);
  }

  Weather? _cachedWeather;
  _onHomePageLoadEvent(
    OnHomePageLoadEvent event,
    Emitter emit,
  ) {
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(weather: _cachedWeather));
  }

  _onHomePageSearchEvent(HomePageSearchEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final response = await _weatherService.getWeather(event.query);
      emit(state.copyWith(weather: response, status: HomeStatus.success));
    } on Failure catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.message,
        ),
      );
    }
  }

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    print(HomeState.fromJson(json).weather.toJson());
    final decodedData = HomeState.fromJson(json);
    print(decodedData.toJson());
    state.copyWith(weather: decodedData.weather);
    return HomeState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    return state.toJson();
  }
}
