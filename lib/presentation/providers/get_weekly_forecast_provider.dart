import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/models/weekly_weather.dart';
import '../../utils/services/api_helper.dart';

final weeklyForecastProvider = FutureProvider.autoDispose<WeeklyWeather>(
  (ref) => ApiHelper.getWeeklyForecast(),
);
