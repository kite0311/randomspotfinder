//TODO: ルーレット画面
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _RouletteScreen();
}

class _RouletteScreen extends State<RouletteScreen> {
  /// Roulette values
  List<String> Item = [];

  /// Result of roulette
  List<String> results = [];
  int? selectedIndex;
  StreamController<int> selected = StreamController<int>();

  /// Initalize ItemList
  @override
  initState() {
    super.initState();
    Item = generateItemList();
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roulette!!!'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 450,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FortuneWheel(
                  animateFirst: true,
                  selected: selected.stream,
                  items:
                      Item.map((e) => FortuneItem(child: Text('$e'))).toList(),
                  onAnimationEnd: () {
                    /// 選択された値があれば結果に追加する
                    if (selectedIndex != null) {
                      setState(() {
                        /// 選択された値をresultsに追加する
                        results.add(Item[selectedIndex!]);

                        /// 次のスピンに備えてnullにする
                        selectedIndex = null;
                      });
                    }
                    Navigator.popAndPushNamed(context, "/home");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Itemlist generator
List<String> generateItemList() {
  int listLength = Random().nextInt(10) + 1;
  String item = '';
  List<String> itemList = [];

  for (int i = 0; i < listLength + 1; i++) {
    item += Random().nextInt(10).toString();
    itemList.add(item);
  }
  return itemList;
}
