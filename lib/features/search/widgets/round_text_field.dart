import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: const TextStyle(
          color: AppColors.white,
        ),
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
          focusColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
