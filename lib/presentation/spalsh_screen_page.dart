import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/presentation/home/bloc/home_bloc_test_view.dart';
import 'package:weather_app_flutter/presentation/home/home_view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1700),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePageBlocTest())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Weather App Flutter",
          style: GoogleFonts.grenze(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
