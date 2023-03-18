import 'package:flutter/material.dart';
import 'package:musium/style/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/regular_text.dart';
import 'package:musium/widgets/long_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signIn';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void toWelcomeScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: IconButton(
                        onPressed: toWelcomeScreen,
                        iconSize: 25,
                        icon: SvgPicture.asset(
                          "assets/icons/left-md.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logo_box.png',
                          ),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  const FittedBox(
                    child: RegularText(
                      text: 'Let’s get you in',
                      fontSize: 44,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 60,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          width: 1, color: AppColors.borderButtonColor),
                      color: AppColors.buttonFillColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 33,
                          width: 33,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/google.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const RegularText(text: 'Continue with Google')
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  Container(
                    height: 60,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          width: 1, color: AppColors.borderButtonColor),
                      color: AppColors.buttonFillColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 33,
                          width: 33,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/facebook.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const RegularText(text: 'Continue with Facebook')
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  Container(
                    height: 60,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          width: 1, color: AppColors.borderButtonColor),
                      color: AppColors.buttonFillColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 33,
                          width: 33,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/apple.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const RegularText(text: 'Continue with Apple')
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: AppColors.mainText,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: RegularText(text: 'or', isMulish: true),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.mainText,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  LongButton(text: 'Log in with a password', function: () {}),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainText,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
