import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/core/services/weather_service.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
            ),
            Expanded(
              child: BlocConsumer<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.status.isInitial) {
                    return Center(
                      child: Text(state.status.name),
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
                    child: Text(state.status.name),
                  );
                },
                listener: (context, state) {},
                buildWhen: (previous, next) => previous.status != next.status,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            context.read<HomeCubit>().fetchWeather(_controller.text);
          }
          return;
        },
      ),
    );
  }
}
