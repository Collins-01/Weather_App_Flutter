import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:network_client/network_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app_flutter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  NetworkClient.init(
    'https://v1.nocodeapi.com',
    enableLogging: true,
    headers: {},
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}
