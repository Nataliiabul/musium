import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musium/screens/favorites_screen.dart';
import 'package:provider/provider.dart';

import 'package:musium/models/auth.dart';
import 'package:musium/models/track.dart';

import 'package:musium/screens/explore_screen.dart';
import 'package:musium/screens/home_screen.dart';
import 'package:musium/screens/library_screen.dart';
import 'package:musium/screens/log_in_screen.dart';
import 'package:musium/screens/registration_screen.dart';
import 'package:musium/screens/sign_in_screen.dart';
import 'package:musium/screens/tabs_screen.dart';
import 'package:musium/screens/welcome_screen.dart';

import 'package:musium/splash_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
        ),
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: auth.isAuth
              ? const TabsScreen()
              : FutureBuilder(
                future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : SignInScreen(),),
          routes: {
            WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
            SignInScreen.routeName: (ctx) => const SignInScreen(),
            LogInScreen.routeName: (ctx) => const LogInScreen(),
            TabsScreen.routeName: (ctx) => const TabsScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            ExploreScreen.routeName: (ctx) => const ExploreScreen(),
            LibraryScreen.routeName: (ctx) => const LibraryScreen(),
            RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
            FavoritesScreen.routeName: (ctx) => const FavoritesScreen(),
          },
        ),
      ),
    );
  }
}
