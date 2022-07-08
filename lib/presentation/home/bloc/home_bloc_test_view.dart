import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_bloc_test.dart';
// import 'package:weather_app_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_events.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_state.dart';

class HomePageBlocTest extends StatelessWidget {
  const HomePageBlocTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBlocTest()..add(const OnHomePageLoadEvent()),
      child: HomeViewBlocTest(),
    );
  }
}

class HomeViewBlocTest extends StatelessWidget {
  HomeViewBlocTest({Key? key}) : super(key: key);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBlocTest, HomeState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            _controller.clear();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Enter City",
                      contentPadding: EdgeInsets.only(
                        left: 16,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeBlocTest, HomeState>(
                    builder: (context, state) {
                      if (state.status.isInitial) {
                        return Center(
                          child: Column(
                            children: [
                              Text("Humidity: ${state.weather.humidity}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Temprature: ${state.weather.temprature}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Longitude: ${state.weather.longitude}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Lattitude: ${state.weather.lattitude}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Description: ${state.weather.description}"),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }
                      if (state.status.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.status.isSuccess) {
                        return Center(
                          child: Column(
                            children: [
                              Text("Humidity: ${state.weather.humidity}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Temprature: ${state.weather.temprature}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Longitude: ${state.weather.longitude}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Lattitude: ${state.weather.lattitude}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Description: ${state.weather.description}"),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(
                        child: Text(state.errorMessage),
                      );
                    },
                    // listener: (context, state) {},
                    buildWhen: (previous, next) =>
                        previous.status != next.status,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            // context.read<HomeCubit>().fetchWeather(_controller.text);
            final bloc = context.read<HomeBlocTest>();
            bloc.add(HomePageSearchEvent(_controller.text));
          }
          return;
        },
      ),
    );
  }
}
