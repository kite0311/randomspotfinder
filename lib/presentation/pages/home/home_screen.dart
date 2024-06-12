import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomspotfinder/presentation/widgets/roulette_button.dart';

import '../../../domain/state/genre_items/genre_items.dart';
import '../../../domain/state/user_search_config_provider.dart';
import '../../widgets/cmn_bottom_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSearchConfig = ref.watch(userSearchConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ホーム画面 ${userSearchConfig}'),
            DistanceSelectSlider(),
            GenreSelectDropDownButton(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RouletteButton(userSearchConfig: userSearchConfig),
      bottomNavigationBar: CmnBottomAppBar(),
    );
  }
}

//ドロップダウンボタン
class GenreSelectDropDownButton extends ConsumerWidget {
  const GenreSelectDropDownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> genreList = ref.watch(genreItemsNotifierProvider);
    final String? selectedItem =
        ref.watch(genreItemsNotifierProvider.notifier).selectedItem;

    return DropdownButton(
      value: selectedItem ?? genreList.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 10,
      style: const TextStyle(color: Colors.green),
      underline: Container(
        height: 4,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        if (value != null) {
          ref.read(genreItemsNotifierProvider.notifier).selectItem(value);
          ref.read(userSearchConfigProvider.notifier).updateGenre(value);
          print(selectedItem);
        }
      },
      items: genreList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// スライダー
class DistanceSelectSlider extends ConsumerWidget {
  const DistanceSelectSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _currentSliderValue = ref.watch(_DistanceProvider);

    return Slider(
      value: _currentSliderValue,
      max: 50,
      // 1,3,5,7,10,15,20,30,40,50の10等
      divisions: 10,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        _currentSliderValue =
            ref.read(_DistanceProvider.notifier).updateDistance(value);
        ref.read(userSearchConfigProvider.notifier).updateDistance(value);
        print(ref.read(_DistanceProvider.notifier).calcDistanceToMeter(value));
      },
    );
  }
}

class distanceNotifier extends StateNotifier<double> {
  distanceNotifier() : super(0.0);

  updateDistance(double value) {
    state = value;
    return state;
  }

  double calcDistanceToMeter(double value) {
    return value * 1000;
  }
}

final _DistanceProvider = StateNotifierProvider<distanceNotifier, double>(
    (ref) => distanceNotifier());
