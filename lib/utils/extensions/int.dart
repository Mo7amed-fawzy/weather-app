import 'package:jiffy/jiffy.dart';

//This extension enhances the int type by allowing it to convert Unix timestamps (in seconds) to human-readable date and time formats using the Jiffy package.
extension ConvertTimestampToTime on int {
  // الانتيجر دا بيمثل عادة Unix timestamp الطابع الزمني (وهو عدد الثواني منذ 1 يناير 1970)
  String get time =>
      Jiffy.parseFromMillisecondsSinceEpoch(this * 1000).format(pattern: 'Hm');
  // ال timestamp بيقاس بالثواني
  // هنا بستعمل ميلي ثانيه علشان كدا ضربت ف 1000 علشان احول للملي ثانيه
  // (Hm = 14:30)

  String get dateTime => Jiffy.parseFromMillisecondsSinceEpoch(this * 1000)
      .format(pattern: 'yMMMMd');
}

// int timestamp = 1634235600; // مثال على timestamp Unix
// print(timestamp.time);      // هيعرض: "14:00" (حسب قيمة timestamp)
// print(timestamp.dateTime);  // هيعرض: "2021 October 14"

// دا مثال منغير استعمال jiffy 
//int timestamp = 1634235600; // Unix timestamp (بالثواني) 
// // تحويل الطابع الزمني إلى DateTime
// DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
// print(date);  // النتيجة: 2021-10-14 14:00:00.000
