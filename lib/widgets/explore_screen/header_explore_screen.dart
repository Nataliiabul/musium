import 'package:flutter/material.dart';
import 'package:musium/style/color_text.dart';

class HeaderExploreScreen extends StatelessWidget {
  const HeaderExploreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo_box.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(width: 20),
        const ColorText(
          text: 'Search',
          fontSize: 27,
          isBold: true,
        ),
      ],
    );
  }
}
