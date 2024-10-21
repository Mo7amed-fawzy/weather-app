import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/screens/home_screen.dart';
import 'package:weather_app/utils/constants/theme_mode.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

// beautiful Sky With Cloud Nine اسامي
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeMode.lightMode,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
