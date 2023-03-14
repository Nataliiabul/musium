import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final bool isMulish;
  final bool isLightColor;
  final bool isLightWeight;
  const RegularText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.textAlign = TextAlign.left,
    this.isMulish = false,
    this.isLightColor = false,
    this.isLightWeight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isMulish ? 'Mulish' : 'Century-Gothic',
        fontSize: fontSize,
        fontWeight: isLightWeight ? FontWeight.w400 : FontWeight.bold,
        color: isLightColor ? AppColors.accentText : AppColors.mainText,
      ),
      textAlign: textAlign,
    );
  }
}
