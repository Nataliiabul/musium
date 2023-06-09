import 'package:flutter/material.dart';
import 'package:musium/models/track.dart';
import 'package:musium/screens/song_screen.dart';
import 'package:musium/style/regular_text.dart';

class TrackBlock extends StatelessWidget {
  const TrackBlock({
    super.key,
    required this.width,
    required this.height,
    required this.track,
  });

  final double width;
  final double height;
  final TrackItem track;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SongScreen(track: track),
              ),
            );
          },
          child: Container(
            width: width,
            height: height * 0.13,
            decoration: BoxDecoration(
              color: const Color(0xff1E1E1E).withOpacity(0.87),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 7),

                // track image
                Container(
                  width: height * 0.13 - 15,
                  height: height * 0.13 - 15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(track.coverURL), fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.07),

                // text block
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // track title
                    RegularText(text: track.title, fontSize: 17),
                    const SizedBox(height: 5),
                    // track author
                    RegularText(
                      text: track.author,
                      fontSize: 14,
                      isLightColor: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
