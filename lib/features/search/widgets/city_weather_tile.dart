import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/data/providers/get_city_forecast_provider.dart';
import 'package:weather_app/utils/constants/app_colors.dart';
import 'package:weather_app/utils/constants/text_styles.dart';
import 'package:weather_app/utils/models/famous_city_local.dart';
import 'package:weather_app/utils/util/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  const FamousCityTile({
    super.key,
    required this.city,
    required this.index,
  });

  final FamousCity city;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('Fetching weather data from provider for قبل ${city.name}');
    }

    final currentWeather = ref.watch(cityForecastProvider(city.name));

    if (currentWeather.isLoading) {
      if (kDebugMode) {
        print('Loading data for ${city.name}');
      }
    } else if (currentWeather.hasError) {
      if (kDebugMode) {
        print('Error fetching data for ${city.name}: ${currentWeather.error}');
      }
    } else if (currentWeather.hasValue) {
      final weather = currentWeather.value;
      if (kDebugMode) {
        print('Fetched data for ${city.name}: ${weather?.main.temp}');
      }
    }
    if (kDebugMode) {
      print('Fetching weather data from provider forبعد ${city.name}');
    }

    if (currentWeather.isLoading) {
      if (kDebugMode) {
        print('Loading data for ${city.name}');
      }
    } else if (currentWeather.hasError) {
      if (kDebugMode) {
        print('Error fetching data for ${city.name}: ${currentWeather.error}');
      }
    } else {
      if (kDebugMode) {
        print('Fetched data for ${city.name}: ${currentWeather.error}');
      }
    }

    return currentWeather.when(
      data: (weather) {
        if (kDebugMode) {
          print('Weather data forمدن ${city.name}: ${weather.main.temp}');
        }

        return Padding(
          padding: const EdgeInsets.all(
            0.0,
          ),
          child: Material(
            color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
            elevation: index == 0 ? 12 : 0,
            borderRadius: BorderRadius.circular(25.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row 1
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weather.main.temp.round().toString()}°',
                              style: TextStyles.h2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              weather.weather[0].description,
                              style: TextStyles.subtitleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      // Row 2
                      Image.asset(
                        getWeatherIcon(idweatherCode: weather.weather[0].id),
                        width: 50,
                      ),
                    ],
                  ),
                  Text(
                    weather.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        if (kDebugMode) {
          print('Error for cityمشكلة هنا ${city.name}: $error');
        }

        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

double parseToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else {
    throw Exception('Unexpected value type');
  }
}
