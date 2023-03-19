import 'package:flutter/material.dart';

import 'package:musium/screens/log_in_screen.dart';
import 'package:musium/screens/sign_in_screen.dart';
import 'package:musium/screens/welcome_screen.dart';
import 'package:musium/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
