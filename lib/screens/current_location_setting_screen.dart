//TODO: 現在地の設定画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomspotfinder/screens/search_radius_setting_screen.dart';

class CurrentLocationSettingScreen extends StatelessWidget {
  const CurrentLocationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('現在地の設定'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('現在地を設定してください'),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchRadiusSettingScreen(),
                  ),
                );
              },
              child: Text('設定'),
            ),
          ],
        ),
      ),
    );
  }
}
