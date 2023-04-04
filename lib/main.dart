import 'package:flutter/material.dart';
import 'package:musium/models/track.dart';
import 'package:musium/screens/song_screen.dart';

import 'package:musium/screens/explore_screen.dart';
import 'package:musium/screens/home_screen.dart';
import 'package:musium/screens/library_screen.dart';
import 'package:musium/screens/log_in_screen.dart';
import 'package:musium/screens/sign_in_screen.dart';
import 'package:musium/screens/tabs_screen.dart';
import 'package:musium/screens/welcome_screen.dart';

import 'package:musium/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Track(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const SplashScreen(),
        routes: {
          WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          LogInScreen.routeName: (ctx) => const LogInScreen(),
          TabsScreen.routeName: (ctx) => const TabsScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ExploreScreen.routeName: (ctx) => const ExploreScreen(),
          LibraryScreen.routeName: (ctx) => const LibraryScreen(), 
        },
      ),
    );
  }
}
