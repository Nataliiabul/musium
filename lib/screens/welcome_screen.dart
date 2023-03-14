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
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3));
  }

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
                child: Container(
                  height: constraints.maxHeight * 0.44,
                  width: constraints.maxWidth,
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
                  child: Column(
                    children: [
                      RegularText(
                        text:
                            'From the latest to the greatest hits, play your favorite tracks on musium now!',
                        fontSize: 24,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 53,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.mainText,
                              borderRadius: BorderRadius.all(
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
                              color: AppColors.mainText,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: RegularText(
                            text: 'Get Started',
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            backgroundColor: AppColors.buttonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            shadowColor: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
