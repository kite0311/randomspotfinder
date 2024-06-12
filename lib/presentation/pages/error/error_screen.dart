//TODO: エラー画面
import 'package:flutter/material.dart';
import 'package:randomspotfinder/presentation/pages/user/user_profile_screen.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(errorMessage),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen(),
                  ),
                );
              },
              child: Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
