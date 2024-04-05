//TODO: 全体マップ画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///マップ事態に検索機能はないが、ピンを打ったりできるマップを表示させたい画面
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: Text('Map'),
      ),
    );
  }
}