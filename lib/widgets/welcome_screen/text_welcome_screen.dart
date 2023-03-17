import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';

class TextWelcomeScreen extends StatelessWidget {
  const TextWelcomeScreen({
    Key? key,
  }) : super(key: key);

  final whiteTextStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.mainText,
  );

  final colorTextStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonColor,
  );

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'From the ',
            style: whiteTextStyle,
          ),
          TextSpan(
            text: 'latest ',
            style: colorTextStyle,
          ),
          TextSpan(
            text: 'to the ',
            style: whiteTextStyle,
          ),
          TextSpan(
            text: 'greatest ',
            style: colorTextStyle,
          ),
          TextSpan(
            text: 'hits, play your favorite tracks on ',
            style: whiteTextStyle,
          ),
          TextSpan(
            text: 'musium ',
            style: colorTextStyle,
          ),
          TextSpan(
            text: 'now!',
            style: whiteTextStyle,
          )
        ],
      ),
    );
  }
}
