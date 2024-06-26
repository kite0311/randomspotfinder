// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAlxKpPIT9EO1r_yAPvm-HU7tJBdYCXm74',
    appId: '1:688576205677:web:ab81b197097361fcaa8064',
    messagingSenderId: '688576205677',
    projectId: 'random-spot-finder-98e49',
    authDomain: 'random-spot-finder-98e49.firebaseapp.com',
    storageBucket: 'random-spot-finder-98e49.appspot.com',
    measurementId: 'G-4297F8NK41',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTKfx_P1g-w4PUWQLCoWX1fUMow5iCd7Y',
    appId: '1:688576205677:android:eb80dac86e7b8fb5aa8064',
    messagingSenderId: '688576205677',
    projectId: 'random-spot-finder-98e49',
    storageBucket: 'random-spot-finder-98e49.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7WQt6A5R_QCWswaxzBjx1fifqE-T3PHk',
    appId: '1:688576205677:ios:a1216cdbad41df1faa8064',
    messagingSenderId: '688576205677',
    projectId: 'random-spot-finder-98e49',
    storageBucket: 'random-spot-finder-98e49.appspot.com',
    iosBundleId: 'com.example.randomspotfinder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7WQt6A5R_QCWswaxzBjx1fifqE-T3PHk',
    appId: '1:688576205677:ios:38fe029f7a587068aa8064',
    messagingSenderId: '688576205677',
    projectId: 'random-spot-finder-98e49',
    storageBucket: 'random-spot-finder-98e49.appspot.com',
    iosBundleId: 'com.example.randomspotfinder.RunnerTests',
  );
}
