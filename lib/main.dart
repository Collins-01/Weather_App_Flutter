import 'package:flutter/material.dart';
import 'package:network_client/network_client.dart';
import 'package:weather_app_flutter/presentation/home/home_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
  NetworkClient.init(
    'https://v1.nocodeapi.com',
    headers: {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
