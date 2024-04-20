import 'package:flutter/material.dart';
import 'package:randomspotfinder/presentation/widgets/roulette_button.dart';

import '../../widgets/cmn_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('ホーム画面'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RouletteButton(),
      bottomNavigationBar: CmnBottomAppBar(),
    );
  }
}
