//TODO: 初期画面(ログイン/非ログインの認証を行う)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../map/googlemap/location_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text('ログイン'),
                ),

                /// Firebaseテスト用ボタン
                /// TODO: 本番リリース時に削除
                /// TODO: ボタン押下後にデータが追加されないため、修正が必要
                ElevatedButton(
                  onPressed: () {
                    _addToFirebase();
                  },
                  child: Text('Firebase_Test'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _addToFirebase() async {
  final db = FirebaseFirestore.instance;

  final user = <String, dynamic>{
    "first": "first",
    "last": "Last",
    "born": 2024
  };

  // Firestoreにデータを追加
  await db.collection('users').add(user);
}

class PermissionCurrentLocation extends StatefulWidget {
  const PermissionCurrentLocation({super.key});

  @override
  State<PermissionCurrentLocation> createState() => _PermissionCurrentLocationState();
}

class _PermissionCurrentLocationState extends State<PermissionCurrentLocation> {
  @override
  void initState() {
    super.initState();
    LocationService().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
