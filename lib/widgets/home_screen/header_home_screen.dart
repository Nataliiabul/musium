import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.lightBlue,
          radius: 23,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RegularText(
              text: 'Welcome back!',
              fontSize: 15,
            ),
            RegularText(
              text: 'username',
              fontSize: 13,
              isLightColor: true,
            ),
          ],
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/bar-2.svg',
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/bell.svg')),
        IconButton(
            onPressed: () {},
            icon:
                SvgPicture.asset('assets/icons/settings-ui.svg')),
      ],
    );
  }
}
