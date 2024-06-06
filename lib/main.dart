import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomspotfinder/presentation/pages/favorite/favorite_screen.dart';
import 'package:randomspotfinder/presentation/pages/home/home_screen.dart';
import 'package:randomspotfinder/presentation/pages/login/login_screen.dart';
import 'package:randomspotfinder/presentation/pages/map/map_screen.dart';
import 'package:randomspotfinder/presentation/pages/roulette/roulette_screen.dart';
import 'package:randomspotfinder/presentation/pages/user/user_profile_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // 環境変数の読み込み
  await dotenv.load(fileName: 'assets/develop/.env.development');
  //TODO 本番環境でAPIキーを取得する
  /// dotenv.load(fileName: 'assets/main/.env.production');

  // Firebaseの初期化
  await Firebase.initializeApp(
    name: 'RandomSpotFinder',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const scope = ProviderScope(child: const MyApp());
  runApp(scope);
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
        '/home': (context) => HomeScreen(),
        'roulette': (context) => const RouletteScreen(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}
