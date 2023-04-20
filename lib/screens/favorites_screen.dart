import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';
import 'package:provider/provider.dart';

import 'package:musium/models/track.dart';

import 'package:musium/widgets/home_screen/track_block.dart';
import 'package:musium/widgets/simple_header.dart.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _backScreen() {
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    final trackData = Provider.of<Track>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    Row(
                      children: [
                        IconButton(
                          onPressed: _backScreen,
                          iconSize: 25,
                          icon: SvgPicture.asset(
                            "assets/icons/left-md.svg",
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SimpleHeader(text: 'Your Liked Songs'),
                      ],
                    ),
                    const SizedBox(height: 30),

                    if (trackData.favoriteTracks.isEmpty)
                      const RegularText(
                        text: 'You have not got any liked songs yet...',
                        fontSize: 20,
                        textAlign: TextAlign.justify,
                      ),

                    ...trackData.favoriteTracks.map(
                      (trackItem) => TrackBlock(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        track: trackItem,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
