import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../models/dto/searrch_config/user_search_config.dart';
import '../pages/roulette/roulette_screen.dart';

class RouletteButton extends StatefulWidget {
  const RouletteButton({super.key, required this.userSearchConfig});

  final UserSearchConfig userSearchConfig;

  @override
  State<RouletteButton> createState() => _RouletteButtonState();
}

class _RouletteButtonState extends State<RouletteButton> {
  late UserSearchConfig userSearchConfig = widget.userSearchConfig;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () {
            showDialog<void>(
                context: context,
                builder: (_) {
                  return const RouletteScreen(userSearchConfig: userSearchConfig);
                });
          },
          child: const RiveAnimation.asset(
            'assets/rive/roullette_button.riv',
            animations: ['Rotate'],
          ),
        ),
      ),
    );
  }
}
