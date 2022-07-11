import 'package:flutter/material.dart';
import 'package:weather_app_flutter/utils/app_images.dart';

class WeatherInfo extends StatelessWidget {
  final String title;
  final String detail;
  const WeatherInfo({Key? key, required this.detail, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          child: Text(detail),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.huidity),
            ),
            // color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(title)
      ],
    );
  }
}
