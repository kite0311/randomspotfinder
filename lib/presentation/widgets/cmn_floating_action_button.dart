import 'package:flutter/material.dart';

import '../dialogs/roulette_dialog.dart';

class CmnFloatingActionButton extends StatelessWidget {
  const CmnFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (_) {
              return RouletteDialog();
            });
      },
    );
  }
}
