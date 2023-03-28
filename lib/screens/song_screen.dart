import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/models/track.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class SongScreen extends StatefulWidget {
  static const routeName = '/song';
  const SongScreen({
    super.key,
  });

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  void _backScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final track = ModalRoute.of(context)!.settings.arguments as TrackItem;
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
                  // back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: IconButton(
                        onPressed: _backScreen,
                        iconSize: 25,
                        icon: SvgPicture.asset(
                          "assets/icons/left-md.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth - 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            track.coverURL,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // favorite button
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {},
                        iconSize: 35,
                        icon: Icon(
                          Icons.favorite_outline,
                          color: AppColors.activeSliderColor,
                        )),
                  ),

                  // track title & author
                  RegularText(
                    text: track.title,
                    fontSize: 24,
                  ),
                  const SizedBox(height: 10),
                  RegularText(
                    text: track.author,
                    isLightColor: true,
                  ),
                  const SizedBox(height: 20),

                  // slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 7.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 7.0),
                    ),
                    child: Slider(
                      value: 0.75,
                      onChanged: (value) {},
                      inactiveColor: AppColors.accentText,
                      activeColor: AppColors.activeSliderColor,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // minutes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegularText(
                        text: '0:00',
                        fontSize: 14,
                        isLightColor: true,
                      ),
                      RegularText(
                        text: '2:56',
                        fontSize: 14,
                        isLightColor: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // previous track
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/back_track.svg',
                          width: 20,
                          height: 20,
                        ),
                        splashRadius: 25,
                      ),
                      const SizedBox(width: 20),

                      // play button
                      Container(
                        width: 56,
                        height: 56,
                        padding:
                            const EdgeInsets.only(left: 5, top: 13, bottom: 13),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.mainBlue,
                              AppColors.lightBlue,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/triangle.svg',
                          color: AppColors.mainText,
                        ),
                      ),
                      const SizedBox(width: 20),

                      // next track
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/next_track.svg',
                          width: 20,
                          height: 20,
                        ),
                        splashRadius: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
