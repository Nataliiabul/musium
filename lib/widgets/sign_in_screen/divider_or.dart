import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: AppColors.mainText,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RegularText(text: 'or', isMulish: true),
        ),
        Expanded(
          child: Divider(
            color: AppColors.mainText,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

