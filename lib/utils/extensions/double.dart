// تحويل سرعة الرياح من الوحدة الافتراضية متر/ثانية (m/s) إلى كيلومتر/ساعة (km/h).
// في خدمة الطقس المفتوحة (OpenWeatherMap)، الوحدة الافتراضية لسرعة الرياح هي متر/ثانية لكن ممكن تحتاج تحولها

extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
  // الفنكشن دي بتخلي في ارقام عشرية فالناتج وخليتهم 2(2 decimal places)
}

  //بحول من m/s إلى km/h. 
  // 3.6 × m/s = km/h 
  // 5  ×  3.6 = 18.00 km/h with function

  //double windSpeedInMs = 5.0; // مثال: سرعة الرياح طبيعي بالمتر/ثانية
  //print(windSpeedInMs.kmh);   // هيعرض بالكيلومتر: "18.00"
