import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../pages/roulette/roulette_screen.dart';

class RouletteButton extends StatefulWidget {
  const RouletteButton({super.key});

  @override
  State<RouletteButton> createState() => _RouletteButtonState();
}

class _RouletteButtonState extends State<RouletteButton> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (_) {
              return RouletteScreen();
            });
      },
      child: RiveAnimation.asset(
        'assets/rive/roullette_button.riv',
        animations: ['Rotate'],
      ),
    );
  }
}
