import 'package:flutter/material.dart';
import 'package:musium/style/colors.dart';

class SongScreen extends StatefulWidget {
  static const routeName = '/song';
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
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
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}