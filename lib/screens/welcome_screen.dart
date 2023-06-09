import 'package:flutter/material.dart';
import 'package:musium/models/system.dart';

import 'package:musium/style/colors.dart';

import 'package:musium/widgets/welcome_screen/card_welcome_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  late System system;

  @override
  void initState() {
    super.initState();
    system = Provider.of<System>(context, listen: false);
  }

  @override
  void dispose() {
    setSystemData();
    super.dispose();
  }

  Future<void> setSystemData () async {
    await system.setFirstLoading();
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