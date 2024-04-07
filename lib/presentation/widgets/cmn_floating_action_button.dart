import 'package:flutter/material.dart';

import '../pages/roulette/roulette_screen.dart';


class CmnFloatingActionButton extends StatelessWidget {
  const CmnFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    ///TODO: ルーレットのアイコンはアニメーションにする
    return FloatingActionButton(
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (_) {
              return RouletteScreen();
            });
      },
    );
  }
}
