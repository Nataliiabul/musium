import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.mainText,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RegularText(text: text, isMulish: true),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.mainText,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

