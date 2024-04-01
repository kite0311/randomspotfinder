//TODO: 初期画面(ログイン/非ログインの認証を行う)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomspotfinder/screens/current_location_setting_screen.dart';

class InitailScreen extends StatelessWidget {
  const InitailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ログインしてください'),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentLocationSettingScreen(),
                  ),
                );
              },
              child: Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
