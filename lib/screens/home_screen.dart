import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:musium/models/track.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final trackData = Provider.of<Track>(context).tracks;
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
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/bar-2.svg',
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/bell.svg')),
                      IconButton(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset('assets/icons/settings-ui.svg')),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const RegularText(text: 'Music Tracks', fontSize: 20),
                  const SizedBox(height: 20),

                  //
                  ...trackData.map((trackItem) {
                    return Column(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.13,
                          decoration: BoxDecoration(
                            color: const Color(0xff1E1E1E).withOpacity(0.87),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 7),
                              Container(
                                width: constraints.maxHeight * 0.13 - 15,
                                height: constraints.maxHeight * 0.13 - 15,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                ),
                              ),
                              SizedBox(width: constraints.maxWidth * 0.07),
                             
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegularText(text: trackItem.title, fontSize: 17),
                                  SizedBox(height: 5),
                                  RegularText(text: trackItem.author, fontSize: 14, isLightColor: true,)
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
