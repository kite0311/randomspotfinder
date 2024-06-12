//TODO: ルーレット画面
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:randomspotfinder/models/dto/searrch_config/user_search_config.dart';

import '../../../constant/genreTypes.dart';

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key, required UserSearchConfig userSearchConfig});

  @override
  State<RouletteScreen> createState() => _RouletteScreen();
}

class _RouletteScreen extends State<RouletteScreen> {
  /// Roulette values
  List<String> Item = [];

  /// テスト用の文字列
  GenreTypes entertainment = GenreTypes.Entertainment;

  /// Result of roulette
  List<String> results = [];
  int? selectedIndex;
  StreamController<int> selected = StreamController<int>();

  /// Initalize ItemList
  @override
  initState() {
    super.initState();
    Item = generateItemTypes(entertainment);
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
                    Navigator.popAndPushNamed(context, "/map");
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
List<String> generateItemTypes(GenreTypes type) {
  List<String> typesList = [];

  switch (type) {
    case Entertainment:
      return typesList = Entertainment.entertainmentList;
    case FoodAndDrink:
      return typesList = FoodAndDrink.foodAndDrinkList;
    case Shopping:
      return typesList = Shopping.shoppingList;
    case HealthAndWellness:
      return typesList = HealthAndWellness.healthAndWellnessList;
    case Services:
      return typesList = Services.servicesList;
    case Transportation:
      return typesList = Transportation.transportationList;
    case EducationAndGovernment:
      return typesList = EducationAndGovernment.educationAndGovernmentList;
    case Miscellaneous:
      return typesList = Miscellaneous.miscellaneousList;
  }

  return typesList;
}
