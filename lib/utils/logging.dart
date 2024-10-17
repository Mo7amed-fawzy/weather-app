import 'package:flutter/material.dart';

void printWarning(String text) {
  // بستخدم ANSI code علشان اطبع فالكونسول بالوان واقدر اعدل علي (اللون، النمط، أو الخلفية)
  debugPrint('\x1B[33m$text\x1B[0m');
  // \x1B[33m (لون اصفر (تحذير - \x1B[0m كتابة باللون الديفولت للبعد التكست
// debugPrint دي بتستخدم علشان اطبع التكست فالكونسول فخلال الديبج مود
}

void printError(String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
  // ANSI: \x1B[31m لون احمر (خطأ)
}

void printInfo(String text) {
  debugPrint('\x1B[34m$text\x1B[0m');
  // ANSI: \x1B[34m لون ازرق (المعلومات)
}

void printSuccess(String text) {
  debugPrint('\x1B[32m$text\x1B[0m');
  // ANSI: \x1B[32m لون اخضر (النجاح)
}
