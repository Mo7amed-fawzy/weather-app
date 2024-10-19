bool isNightTime(int timestamp) {
  // بحول للملي ثانيه
  final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  final hour = dateTime.hour; // كدا بطلع الساعه من الاوبجكت

  return hour < 6 || hour >= 18;
  // بعتبر ليل لو كانت الساعة أقل من 6 أو أكبر من أو تساوي 18 وترجع تروو والعكس فولس
}
