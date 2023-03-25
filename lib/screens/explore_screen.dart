import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:musium/models/track.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

import 'package:musium/widgets/explore_screen/category_item_block.dart';
import 'package:musium/widgets/simple_header.dart.dart';


class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore';
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final hintStyle = const TextStyle(
    fontSize: 13,
    fontFamily: 'Century-Gothic',
    color: Color(0xff8A9A9D),
  );
  @override
  Widget build(BuildContext context) {
    final trackData = Provider.of<Track>(context);
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
                  // header
                  const SimpleHeader(text: 'Search',),
                  const SizedBox(height: 30),

                  // search field
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      hintText: 'Songs, Artists',
                      hintStyle: hintStyle,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff8A9A9D),
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),

                  // title
                  const RegularText(
                    text: 'Categories',
                    fontSize: 20,
                  ),
                  const SizedBox(height: 17),

                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: trackData.categories.map((categoryItem) {
                        return CategoryItemBlock(
                          height: constraints.maxHeight * 0.15,
                          width: constraints.maxWidth * 0.39,
                          categoryItemText: categoryItem,
                        );
                      }).toList(),
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
