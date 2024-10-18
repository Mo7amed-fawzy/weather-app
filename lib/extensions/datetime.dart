import 'package:jiffy/jiffy.dart';
// دي شبه Moment.js فجافاسكربت

extension FormatDateTime on DateTime {
  // بستعمل اكستنشن علشان اعمل custom functionality علي دات تايم
  String get dateTime =>
      // بضيف getter جديده لكلاس الدات تايم واسمها دات تايم
      Jiffy.parseFromDateTime(this).format(pattern: 'yMMMMd');
  // البروبيرتي بتحول اوبجكت الدات تايم ل سترنج ب jiffy (2024 October 18)
}
//parseFromDateTime(this) كدا بحول الدات تايم الاساسي اوبجكت ل jiffy اوبجكت

extension DayOfWeek on DateTime {
  String get dayOfWeek => Jiffy.parseFromDateTime(this).format(pattern: 'EEEE');
  // برجع اليوم من الاسبوع لاوبجكت الدات تايم الحالي (Friday)
}

// DateTime now = DateTime.now(); // مثال 
// print(now.dateTime);   // هيطبع: "2024 October 18"
// print(now.dayOfWeek);  // هيطبع: "Friday"
