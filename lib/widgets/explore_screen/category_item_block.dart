import 'package:flutter/material.dart';
import 'package:musium/style/colors.dart';

class CategoryItemBlock extends StatelessWidget {
  const CategoryItemBlock({
    super.key,
    required this.categoryItemText,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final String categoryItemText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      height: height,
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: AppColors.mainBlue,
      ),
      child: Text(
        categoryItemText,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Century-Gothic',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
