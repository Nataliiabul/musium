import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: constraints.maxHeight * 0.44 - 54,
                child: Container(
                  height: constraints.maxHeight * 0.47,
                  width: constraints.maxWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_girl.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: CardWelcomeScreen(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CardWelcomeScreen extends StatelessWidget {
  final double height;
  final double width;
  const CardWelcomeScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.44,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(54),
          topRight: Radius.circular(54),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 57,
        left: 30,
        right: 30,
      ),
      child: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InfoColumnWelcomeScreen(index: index),
        ),
      ),
    );
  }
}

class InfoColumnWelcomeScreen extends StatelessWidget {
  final int index;
  const InfoColumnWelcomeScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RegularText(
          text:
              'From the latest to the greatest hits, play your favorite tracks on musium now!',
          fontSize: 24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
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
                  )),
            )
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 25),
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              shadowColor: AppColors.buttonColor,
            ),
            child: const RegularText(
              text: 'Get Started',
            ),
          ),
        ),
      ],
    );
  }
}
