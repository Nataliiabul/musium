import 'package:flutter/material.dart';
import 'package:musium/style/colors.dart';

class CircleContinueWithButton extends StatelessWidget {
  CircleContinueWithButton({
    super.key,
    required this.imgPath
  });

  String imgPath;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(25)),
        border: Border.all(
            color: AppColors.borderButtonColor, width: 1),
      ),
      child: CircleAvatar(
        backgroundImage:
            AssetImage(imgPath),
        backgroundColor: AppColors.background,
      ),
    );
  }
}


