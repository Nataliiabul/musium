import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.lightBlue,
                        radius: 23,
                      ),
                      const SizedBox(width: 15),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          RegularText(
                            text: 'Welcome back!',
                            fontSize: 15,
                          ),
                          RegularText(
                            text: 'username',
                            fontSize: 13,
                            isLightColor: true,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/bar-2.svg',)),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/bell.svg')),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/settings-ui.svg')),
                    ],
                  ),
                  SizedBox(height: 40),
                  RegularText(text: 'Music Tracks', fontSize: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
