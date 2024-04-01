//TODO: ルーレット画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouletteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーレット'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ルーレット画面',
            ),
          ],
        ),
      ),
    );
  }
}
