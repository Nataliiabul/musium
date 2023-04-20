import 'package:flutter/material.dart';
import 'package:musium/screens/favorites_screen.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/widgets/library_screen/library_function.dart';
import 'package:musium/widgets/simple_header.dart.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = '/library';
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {

  void _moveToFavoriteScreen() {
    Navigator.of(context).pushNamed(FavoritesScreen.routeName);
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
                  // header
                  const SimpleHeader(
                    text: 'Your Library',
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    color: AppColors.lightBlue,
                  ),
                  const SizedBox(height: 15),

                  //
                  LibraryFunction(
                    iconPath: 'assets/icons/love.svg',
                    title: 'Your Liked Songs',
                    function: _moveToFavoriteScreen,
                  ),
                  SizedBox(height: 15),

                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
