import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:musium/screens/registration_screen.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

import 'package:musium/widgets/form_data.dart';
import 'package:musium/widgets/log_in_screen/circle_continue_with_button.dart';
import 'package:musium/widgets/sign_in_screen/divider_or.dart';
import 'package:musium/widgets/sign_in_screen/sign_up_text_and_button.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/logIn';
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  void toSignInScreen() {
    Navigator.of(context).pop();
  }

  void toRegistration() {
    Navigator.of(context).pushNamed(RegistrationScreen.routeName);
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          child: Container(
            width: constraints.maxWidth,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: IconButton(
                        onPressed: toSignInScreen,
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
                    height: constraints.maxHeight * 0.15,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo_box.png',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * 0.04),

                  // text
                  const FittedBox(
                    child: RegularText(
                      text: 'Login to your account',
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),

                  
                  // fields
                  FormData(isRegistration: false, width: constraints.maxWidth),
                  const SizedBox(height: 15),

                  // remember box
                  // RememberBox(isChecked: isChecked),
                  // const SizedBox(height: 30),

                  // forgot password
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot the password?',
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // divider
                  const DividerOr(text: 'or continue with'),
                  const SizedBox(height: 30),

                  // continue with circle buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CircleContinueWithButton(
                          imgPath: 'assets/images/google.png'),
                      CircleContinueWithButton(
                          imgPath: 'assets/images/facebook.png'),
                      CircleContinueWithButton(
                          imgPath: 'assets/images/apple.png'),
                    ],
                  ),

                  // sign up
                  const SizedBox(height: 15),
                  SignUpTextAndButton(
                    registration: toRegistration,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
