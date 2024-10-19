import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/extensions/double.dart';
import 'package:weather_app/utils/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weatherInfoMObj,
  });

  final Weather weatherInfoMObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
            title: 'Temp',
            value: '${weatherInfoMObj.main.temp}°',
          ),
          WeatherInfoTile(
            title: 'Wind',
            value: '${weatherInfoMObj.wind.speed.kmh} km/h',
          ),
          WeatherInfoTile(
            title: 'Humidity',
            value: '${weatherInfoMObj.main.humidity}%',
          ),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  }) : super();

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title
        Text(
          title,
          style: TextStyles.subtitleText,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: TextStyles.h3,
        )
      ],
    );
  }
}
