import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class SignUpTextAndButton extends StatelessWidget {
  const SignUpTextAndButton({
    super.key,
  });

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
          onPressed: () {},
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
