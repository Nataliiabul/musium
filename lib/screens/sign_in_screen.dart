import 'package:flutter/material.dart';
import 'package:musium/screens/log_in_screen.dart';
import 'package:musium/screens/registration_screen.dart';
import 'package:musium/style/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/regular_text.dart';
import 'package:musium/widgets/long_button.dart';
import 'package:musium/widgets/sign_in_screen/continue_with_button.dart';
import 'package:musium/widgets/sign_in_screen/divider_or.dart';
import 'package:musium/widgets/sign_in_screen/sign_up_text_and_button.dart';

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

  void toLogIn() {
    Navigator.of(context).pushNamed(LogInScreen.routeName);
  }

  void toRegistration() {
    Navigator.of(context).pushNamed(RegistrationScreen.routeName);
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
                  // back button
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

                  // logo
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo_box.png',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),

                  // text
                  const FittedBox(
                    child: RegularText(
                      text: 'Let’s get you in',
                      fontSize: 44,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // continue with ... buttons
                  ContinueWithButton(
                    width: constraints.maxWidth,
                    text: 'Continue with Google',
                    imgPath: 'assets/images/google.png',
                  ),
                  const SizedBox(height: 17),
                  ContinueWithButton(
                    width: constraints.maxWidth,
                    text: 'Continue with Facebook',
                    imgPath: 'assets/images/facebook.png',
                  ),
                  const SizedBox(height: 17),
                  ContinueWithButton(
                    width: constraints.maxWidth,
                    text: 'Continue with Apple',
                    imgPath: 'assets/images/apple.png',
                  ),
                  const SizedBox(height: 40),

                  // divider
                  const DividerOr(text: 'or'),
                  const SizedBox(height: 40),

                  // log in with password button
                  LongButton(
                      text: 'Log in with a password',
                      width: constraints.maxWidth,
                      function: toLogIn),
                  const SizedBox(height: 20),

                  // sign up text & button
                  SignUpTextAndButton(
                    registration: toRegistration,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
