import 'package:flutter/material.dart';
import 'package:weather_app_flutter/presentation/spalsh_screen_page.dart';
import 'package:weather_app_flutter/utils/app_images.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImages(context);
    return MaterialApp(
      title: 'Weather App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenPage(),
    );
  }
}

precacheImages(BuildContext context) {
  Future.wait([
    precacheImage(const AssetImage(AppImages.error), context),
    precacheImage(const AssetImage(AppImages.huidity), context),
    precacheImage(const AssetImage(AppImages.rainy), context),
    precacheImage(const AssetImage(AppImages.thunderRain), context),
  ]);
}
