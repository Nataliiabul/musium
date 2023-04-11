import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:musium/models/track.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/widgets/home_screen/track_block.dart';
import 'package:musium/widgets/simple_header.dart.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});
  final String category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _backScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesTracks =
        Provider.of<Track>(context).categoriesTracks(widget.category);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth,
              padding: const EdgeInsets.all(20),
              child: Column(
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
                      SimpleHeader(text: widget.category),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ...categoriesTracks.map(
                    (trackItem) => TrackBlock(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      track: trackItem,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
