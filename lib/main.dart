import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:randomspotfinder/presentation/pages/favorite/favorite_screen.dart';
import 'package:randomspotfinder/presentation/pages/login/login_screen.dart';
import 'package:randomspotfinder/presentation/pages/user/user_profile_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'RandomSpotFinder',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Spot Finder',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/favorite': (context) => const FavoriteScreen(),
      },
    );
  }
}
