import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/models/auth.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';
import 'package:provider/provider.dart';

class HeaderHomeScreen extends StatelessWidget {
  HeaderHomeScreen({
    super.key,
    required this.username,
  });

  String username;

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
          children: [
            const RegularText(
              text: 'Welcome back!',
              fontSize: 15,
            ),
            RegularText(
              text: username,
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
            onPressed: () {}, icon: SvgPicture.asset('assets/icons/bell.svg')),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'logOut',
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Century-Gothic',
                    color: AppColors.background,
                  ),
                  
                ),
              ),
            ];
            
          },
          onSelected: (value) {
            if (value == 'logOut') {
              Provider.of<Auth>(context, listen: false).logOut(context);
            } 
          },
          icon: SvgPicture.asset('assets/icons/settings-ui.svg'),
          offset: Offset(-25, 25),
        ),
      ],
    );
  }
}
