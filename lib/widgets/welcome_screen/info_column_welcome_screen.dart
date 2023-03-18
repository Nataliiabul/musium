import 'package:flutter/material.dart';
import 'package:musium/screens/sign_in_screen.dart';

import 'package:musium/style/colors.dart';

import 'package:musium/widgets/long_button.dart';
import 'package:musium/widgets/welcome_screen/text_welcome_screen.dart';

class InfoColumnWelcomeScreen extends StatelessWidget {
  final int index;
  const InfoColumnWelcomeScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  void toSignInScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // text
          const TextWelcomeScreen(),
          const SizedBox(height: 50),

          //dividers
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 53,
                height: 10,
                decoration: BoxDecoration(
                  color: index == 0 ? AppColors.mainBlue : AppColors.mainText,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              Container(
                width: 53,
                height: 10,
                decoration: BoxDecoration(
                  color: index == 1 ? AppColors.mainBlue : AppColors.mainText,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // button
          LongButton(
            text: 'Get Started',
            function: () {
              toSignInScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
