import 'package:flutter/material.dart';

import 'package:musium/models/track.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

import 'package:musium/widgets/home_screen/header_home_screen.dart';
import 'package:musium/widgets/home_screen/track_block.dart';

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
                  // header home screen
                  const HeaderHomeScreen(),
                  const SizedBox(height: 40),

                  // title
                  const RegularText(text: 'Music Tracks', fontSize: 20),
                  const SizedBox(height: 20),

                  // tracks
                  ...trackData.map((trackItem) {
                    return TrackBlock(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      track: trackItem,
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
