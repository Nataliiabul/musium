import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class LibraryFunction extends StatelessWidget {
  const LibraryFunction({
    super.key, required this.iconPath, required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(13),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.mainBlue,
                AppColors.lightBlue,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: SvgPicture.asset(iconPath, color: AppColors.background),
        ),
        const SizedBox(width: 25),
        RegularText(text: title, fontSize: 20,)
      ],
    );
  }
}
