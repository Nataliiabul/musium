import 'package:flutter/material.dart';
import 'package:musium/style/colors.dart';

class CircleContinueWithButton extends StatelessWidget {
  const CircleContinueWithButton({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 1200),
            content: Text('The function has not been added yet'),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: AppColors.borderButtonColor, width: 1),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(imgPath),
          backgroundColor: AppColors.background,
        ),
      ),
    );
  }
}
