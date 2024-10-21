import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/data/providers/get_city_forecast_provider.dart';
import 'package:weather_app/features/home/components/gradient_container.dart';
import 'package:weather_app/features/home/components/weather_info.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/extensions/datetime.dart';
import 'package:weather_app/utils/extensions/strings.dart';
import 'package:weather_app/utils/widgets/custom_back_arrow.dart';
import 'package:weather_app/utils/widgets/custom_loading_indicator.dart';

// class WeatherDetailScreen extends ConsumerWidget {
//   const WeatherDetailScreen({
//     super.key,
//     required this.cityName,
//   });

//   final String cityName;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final weatherData = ref.watch((cityForecastProvider(cityName)));

//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.red,
//       //   automaticallyImplyLeading: false, // بشيل السهم الديفولت
//       //   titleSpacing: 0, // بشيل البادنج الديفولت
//       //   title: Text('das'),
//       // ),
class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityWeatherData = ref.watch((cityForecastProvider(cityName)));

    return Scaffold(
      body:
          //  Stack( // دي طريقة مختلفه باستخدام ستاك
          //   children: [
          cityWeatherData.when(
        data: (weather) {
          return GradientContainer(
            children: [
              const BackArrowIcon(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  // Country name text
                  Text(
                    weather.name,
                    style: TextStyles.h1,
                  ),

                  const SizedBox(height: 20),

                  // Today's date
                  Text(
                    DateTime.now().dateTime,
                    style: TextStyles.subtitleText,
                  ),

                  const SizedBox(height: 50),

                  // Weather icon big
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Weather description
                  Text(
                    weather.weather[0].description.capitalize,
                    style: TextStyles.h2,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Weather info in a row
              WeatherInfo(weatherInfoMObj: weather),

              const SizedBox(height: 15),
            ],
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              'An error has occurred',
            ),
          );
        },
        loading: () {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        },
      ),
      // Positioned(
      //   top: 50,
      //   left: 16,
      //   child: IconButton(
      //     iconSize: 26,
      //     // alignment: Alignment.centerRight,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}
