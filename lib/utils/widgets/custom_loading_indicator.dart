import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_colors.dart';
import 'package:weather_app/utils/constants/loading_list.dart';

class CustomLoadingIndicator extends StatelessWidget {
  // تعريف الخاصية isALLPage
  final bool isALLPage;

  // تمرير القيمة عبر الـ constructor
  const CustomLoadingIndicator({super.key, this.isALLPage = false});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomGif = loadingGifs[random.nextInt(loadingGifs.length)];
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: isALLPage
                ? BoxDecoration(
                    gradient: BackgroundColors.blackThemeColors,
                  )
                : null,
          ),
          if (!isALLPage)
            Container(
              decoration: BoxDecoration(
                color: AppColors.accentBlue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          Center(
            child: Image.asset(randomGif),
          ),
        ],
      ),
    );
  }
}
