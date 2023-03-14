import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';

class ColorText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isDarkColor;
  final bool isBold;
  const ColorText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.isDarkColor = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Century-Gothic',
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
        color: isDarkColor ? AppColors.secondBlue : AppColors.mainBlue,
      ),
    );
  }
}
