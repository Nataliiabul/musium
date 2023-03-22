import 'package:flutter/material.dart';

import 'package:musium/screens/explore_screen.dart';
import 'package:musium/screens/home_screen.dart';
import 'package:musium/screens/library_screen.dart';

import 'package:musium/style/colors.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final _screens = const [
    HomeScreen(),
    ExploreScreen(),
    LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.mainBlue,
        unselectedItemColor: AppColors.mainText,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Library',
          ),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
