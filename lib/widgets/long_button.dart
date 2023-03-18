import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: AppColors.buttonColor,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: AppColors.buttonColor,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
            BoxShadow(
              color: AppColors.buttonColor,
              blurRadius: 5,
              offset: Offset(3, 0),
            ),
            BoxShadow(
              color: AppColors.buttonColor,
              blurRadius: 5,
              offset: Offset(-3, 0),
            ),
          ],
        ),
        child: RegularText(
          text: text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
