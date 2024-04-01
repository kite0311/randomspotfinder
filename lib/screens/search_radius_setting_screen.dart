//TODO: 検索半径設定画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomspotfinder/screens/roulette_screen.dart';

class SearchRadiusSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索半径設定'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouletteScreen(),
                  ),
                );
              },
              child: Text('検索半径設定画面'),
            ),
          ],
        ),
      ),
    );
  }
}
