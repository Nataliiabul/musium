import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';

import 'package:musium/widgets/welcome_screen/info_column_welcome_screen.dart';

class CardWelcomeScreen extends StatelessWidget {
  final double height;
  final double width;
  const CardWelcomeScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.44,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(54),
          topRight: Radius.circular(54),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 57,
        left: 30,
        right: 30,
      ),
      child: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InfoColumnWelcomeScreen(index: index),
        ),
      ),
    );
  }
}