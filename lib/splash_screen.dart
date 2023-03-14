import 'package:flutter/material.dart';
import 'package:musium/screens/welcome_screen.dart';

import 'package:musium/style/color_text.dart';
import 'package:musium/style/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1500)).then((_) =>
        Navigator.pushReplacementNamed(context, WelcomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_box.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const ColorText(
            text: 'musium',
            fontSize: 40,
            isBold: true,
          )
        ],
      ),
    );
  }
}
