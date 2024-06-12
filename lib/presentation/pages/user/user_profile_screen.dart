//TODO: ユーザー設定画面
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー設定'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('ユーザー設定画面'),
          ],
        ),
      ),
    );
  }
}
