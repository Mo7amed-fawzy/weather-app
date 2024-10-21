import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/data/providers/get_current_weather_provider.dart';
import 'package:weather_app/features/home/components/gradient_container.dart';
import 'package:weather_app/utils/widgets/custom_loading_indicator.dart';
import 'package:weather_app/utils/widgets/hourly_forecast_view.dart';
import 'package:weather_app/features/home/components/weather_info.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/extensions/datetime.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherObject = ref.watch(currentWeatherProvider);
    return weatherObject.when(data: (screenweather) {
      return GradientContainer(
        children: [
          const SizedBox(width: double.infinity), // عرض لا نهائي
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(screenweather.name, style: TextStyles.h1),
              const SizedBox(height: 20),
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 260,
                child: Image.asset(
                    'assets/icons/${screenweather.weather[0].icon}.png'),
                // ببدل كل n ب d علشان معنديش صور ليل كله نهار
                //screenweather.weather[0].icon => 01n ,  replaceAll('n', 'd')}.png => 01d
              ),
              const SizedBox(height: 40),
              Text(screenweather.weather[0].description, style: TextStyles.h2),
            ],
          ),
          const SizedBox(height: 40),

          // Weather info in a row
          WeatherInfo(weatherInfoMObj: screenweather),

          const SizedBox(height: 40),

          // Today Daily Forecast
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'today',
                style: TextStyles.h2,
              ),
              TextButton(
                  onPressed: () {}, child: const Text('View full report'))
            ],
          ),
          const SizedBox(height: 15),

          // hourly forcast
          const HourlyForecastView(),
        ],
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const Center(
        child: CustomLoadingIndicator(
          isALLPage: true,
        ),
      );
    });
  }
}
