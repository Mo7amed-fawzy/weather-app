import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/models/weather.dart';
import '../../../utils/services/api_helper.dart';

final cityForecastProvider = FutureProvider.autoDispose.family<Weather, String>
    // family بستعمل الفنكشن دي علشان احط كذا باراميتر علشان احطهم فنفس البروفايدر او الريفرانس
    (
  (ref, String cityName) => ApiHelper.getWeatherByCityName(
    cityName: cityName,
  ),
);
