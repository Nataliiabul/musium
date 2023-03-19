import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';
import 'package:musium/widgets/long_button.dart';
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

  final hintStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.mainText,
  );

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
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: AppColors.buttonFillColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.borderButtonColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: SvgPicture.asset(
                                  'assets/icons/mail.svg',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.scaleDown,
                                  color: Colors.white.withOpacity(0.3)),
                              hintText: 'Email',
                              hintStyle: hintStyle),
                          // validator: (value) {
                          //   if (value!.isEmpty || value.length < 2) {
                          //     return 'Некорректные данные!';
                          //   }
                          // },
                          // onSaved: (value) {
                          //   userEmail = value!;
                          // },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: AppColors.buttonFillColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.borderButtonColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: SvgPicture.asset(
                                  'assets/icons/lock.svg',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.scaleDown,
                                  color: Colors.white.withOpacity(0.3)),
                              hintText: 'Password',
                              hintStyle: hintStyle),
                          // validator: (value) {
                          //   if (value!.isEmpty || value.length < 2) {
                          //     return 'Некорректные данные!';
                          //   }
                          // },
                          // onSaved: (value) {
                          //   userEmail = value!;
                          // },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  //
                  Row(
                    children: [
                       const SizedBox(width: 8),
                      Container(
                        width: 23,
                        height: 23,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: AppColors.background,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(0, -2),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(2, 0),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(-2, 0),
                            ),
                          ],
                        ),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            activeColor: AppColors.background,
                          
                            checkColor: AppColors.buttonColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                     const SizedBox(width: 8),
                      const RegularText(
                        text: 'Remember me',
                      )
                    ],
                  ),
                  const SizedBox(height: 30),

                  LongButton(text: 'Log in', width: constraints.maxWidth, function: () {}),

                  const SizedBox(height: 15),
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

                  //
                  const DividerOr(text: 'or continue with'),
                  const SizedBox(height: 30),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                              color: AppColors.borderButtonColor, width: 1),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/google.png'),
                          backgroundColor: AppColors.background,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                              color: AppColors.borderButtonColor, width: 1),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/facebook.png'),
                          backgroundColor: AppColors.background,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                              color: AppColors.borderButtonColor, width: 1),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/apple.png'),
                          backgroundColor: AppColors.background,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  const SignUpTextAndButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
