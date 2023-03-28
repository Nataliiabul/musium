import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/models/track.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class SongScreen extends StatefulWidget {
  static const routeName = '/song';
  TrackItem track;
  SongScreen({
    super.key,
    required this.track,
  });

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  void _backScreen() {
    Navigator.of(context).pop();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    String url = 'https://www.chosic.com/wp-content/uploads/2022/03/Luke-Bergs-Tropical-Soulmp3.mp3';
    audioPlayer.setSourceUrl(url);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

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
                            widget.track.coverURL,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // favorite button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 35,
                        icon: Icon(
                          Icons.share_outlined,
                          color: AppColors.mainText,
                        ),
                      ),
                      const SizedBox(width: 0),
                      IconButton(
                        onPressed: () {},
                        iconSize: 35,
                        icon: Icon(
                          Icons.favorite_outline,
                          color: AppColors.activeSliderColor,
                        ),
                      ),
                    ],
                  ),

                  // track title & author
                  RegularText(
                    text: widget.track.title,
                    fontSize: 24,
                  ),
                  const SizedBox(height: 10),
                  RegularText(
                    text: widget.track.author,
                    isLightColor: true,
                  ),
                  const SizedBox(height: 20),

                  // slider
                  const SizedBox(height: 5),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 7.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 7.0),
                    ),
                    child: Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await audioPlayer.seek(position);
                        await audioPlayer.resume();
                      },
                      inactiveColor: AppColors.accentText,
                      activeColor: AppColors.activeSliderColor,
                    ),
                  ),
                  const SizedBox(height: 7),

                  // minutes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration - position)),
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
                        child: IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            } else {
                              
                              await audioPlayer.resume();
                            }
                          },
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
