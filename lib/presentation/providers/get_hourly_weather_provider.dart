import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/models/hourly_weather.dart';
import 'package:weather_app/utils/services/api_helper.dart';

final hourlyWeatherProvider =
    FutureProvider.autoDispose<HourlyWeather>((ref) async {
  return ApiHelper.getHourlyForecast();
});
