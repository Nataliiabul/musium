import 'package:flutter/material.dart';
import 'package:musium/models/system.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';
import 'package:provider/provider.dart';

class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({
    super.key,
    required this.width,
    required this.text,
    required this.imgPath,
  });

  final double width;
  final String text;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: AppColors.borderButtonColor),
        color: AppColors.buttonFillColor,
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 1200),
              content: Text('The function has not been added yet'),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(width: 10),
            RegularText(text: text)
          ],
        ),
      ),
    );
  }
}
