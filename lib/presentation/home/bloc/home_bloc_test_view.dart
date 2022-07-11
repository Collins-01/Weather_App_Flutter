import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_bloc_test.dart';
// import 'package:weather_app_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_events.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_state.dart';
import 'package:weather_app_flutter/presentation/home/components/build_weather_content.dart';
import 'package:weather_app_flutter/presentation/home/components/weather_info.dart';
import 'package:weather_app_flutter/utils/app_images.dart';

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
              FocusScope.of(context).unfocus();
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.rainy,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Enter City",
                            // labelText: "Enter City ",
                            contentPadding: EdgeInsets.only(
                              left: 16,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<HomeBlocTest, HomeState>(
                          builder: (context, state) {
                            if (state.status.isInitial) {
                              return BuildWeatherContent(
                                weather: state.weather,
                              );
                            }
                            if (state.status.isLoading) {
                              return Center(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 5,
                                  ),
                                ),
                              );
                            }

                            if (state.status.isSuccess) {
                              return BuildWeatherContent(
                                  weather: state.weather);
                            }

                            if (state.status.isFailure &&
                                state.isNetworkConnectionError) {
                              return Center(
                                child: Image.asset(AppImages.error),
                              );
                            }

                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.error),
                                Text(state.errorMessage)
                              ],
                            ));
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
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          if (_controller.text.isEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(
                    "Pleaase provide a city!",
                  ),
                ),
              );
            return;
          } else {
            final bloc = context.read<HomeBlocTest>();
            bloc.add(HomePageSearchEvent(_controller.text));
          }
        },
      ),
    );
  }
}
