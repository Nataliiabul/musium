import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class SignUpTextAndButton extends StatelessWidget {
  SignUpTextAndButton({required this.registration});

  Function registration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RegularText(
          text: 'Don’t have an account?',
          isMulish: true,
        ),
        OutlinedButton(
          onPressed: () {
            registration();
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
