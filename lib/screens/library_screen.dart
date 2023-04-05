import 'package:flutter/material.dart';

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
                children: const [
                  // header
                  SimpleHeader(
                    text: 'Your Library',
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: AppColors.lightBlue,
                  ),
                  SizedBox(height: 15),

                  //
                  LibraryFunction(
                    iconPath: 'assets/icons/love.svg',
                    title: 'Your Liked Songs',
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
