import 'package:flutter/material.dart';

@immutable
//  immutable:  ال annotation دا يعني أن هذه الكلاس مينفعش يتغير بعد إنشائه

class AppColors {
  //? Blues
  static const Color darkBlue = Color(0xFF0A0B39); // dark blue
  static const Color lightBlue = Color(0xFF1D85E4);
  static const Color accentBlue = Color(0xFF23224A);

  static const Color grey = Color(0xFFB7B6C4);
  static const Color blueGrey = Color(0xFF0A0B39);
  static const Color white = Color(0xFFFFFFFF);

  //! Blacks
  static const Color black = Color(0xFF000000);
  static const Color secondaryBlack = Color(0xFF060620);
}

class BackgroundColors {
  static LinearGradient blackThemeColors = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      AppColors.black,
      AppColors.secondaryBlack,
      AppColors.secondaryBlack.withOpacity(.99),
      AppColors.secondaryBlack.withOpacity(.98),
      AppColors.secondaryBlack.withOpacity(.97),
      AppColors.secondaryBlack.withOpacity(.96),
      AppColors.secondaryBlack.withOpacity(.95),
      AppColors.secondaryBlack.withOpacity(.94),
      AppColors.secondaryBlack.withOpacity(.93),
      AppColors.secondaryBlack.withOpacity(.92),
      AppColors.secondaryBlack.withOpacity(.91),
      AppColors.secondaryBlack.withOpacity(.90),
      AppColors.darkBlue,
      AppColors.accentBlue,
      AppColors.lightBlue,
    ],
  );
}
