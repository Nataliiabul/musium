import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/color_text.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

import 'package:musium/widgets/form_data.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  void toBackScreen() {
    Navigator.of(context).pop();
  }

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
                        onPressed: toBackScreen,
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
                      text: 'Create your account',
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),

                  // form data
                  FormData(isRegistration: true, width: constraints.maxWidth),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
