import 'package:flutter/material.dart';

class SuperscriptText extends StatelessWidget {
  const SuperscriptText({
    super.key,
    required this.text,
    required this.superScript,
    required this.textcolor,
    required this.superscriptColor,
  });

  final String text;
  final Color textcolor;
  final String superScript;
  final Color superscriptColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          superScript,
          style: TextStyle(
            color: superscriptColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
