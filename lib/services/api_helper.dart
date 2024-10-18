import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/weekly_weather.dart';
import 'package:weather_app/services/geolocator.dart';
import '/constants/constants.dart';
import '/utils/logging.dart';
import '/models/weather.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';
// لتوقعات الطقس الاسبوعيه

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  //! باخد موقع المستخدم وبحطهم فالمتغيرات
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //  بفلتر البالقيم المعايه علشان اخد اللوكشين بتاعي وبستخدم (Expression Functions) أو Arrow Functions.
  static String _constructWeatherUrl() => // الطقس فالمكان الحالي مع اضافة units
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructForecastUrl() => //توقعات الطقس بناءً على الموقع الجغرافي
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';
//بجيب توقعات الطقس الأسبوعية باستخدام خط العرض وخط الطول

  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';
  //بجيب بيانات الطقس بناءً على اسم المدينة

  //* Fetch Data for a url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      printWarning('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
  }

  //* Current Weather
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation(); // باخد موقع المستخدم
    final url = _constructWeatherUrl(); // ببني يوارال للطقس الحالي
    final response = await _fetchData(url); // بعمل كدا باستخدام السيرفيز دي
    return Weather.fromJson(response); // البيانات المستلمه بحولها لمودل
  }

  //* Hourly Weather
  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl(); // للحصول على بيانات التوقعات بالساعه
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  //* Weekly weather
  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url =
        _constructWeeklyForecastUrl(); // للحصول على بيانات التوقعات الاسبوعية
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  //* Weather by City Name
  static Future<Weather> getWeatherByCityName(
      {required String cityName}) async {
    final url = _constructWeatherByCityUrl(cityName); //بيانات الطقس للمدينة
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }
}
