import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/utils/services/api_helper.dart';

//بتاعت الget وبشيله اول مبقاش عايزه
final currentWeatherProvider = FutureProvider.autoDispose((ref) async {
  return ApiHelper.getCurrentWeather();
});
