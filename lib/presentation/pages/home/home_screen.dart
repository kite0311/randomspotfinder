import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomspotfinder/constant/types.dart';
import 'package:randomspotfinder/presentation/pages/home/test.dart';
import 'package:randomspotfinder/presentation/widgets/roulette_button.dart';

import '../../widgets/cmn_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelectedItem = Entertainment.entertainmentList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('ホーム画面'),
            DropDown(
              onSelected: (selectedItems) {
                var isSelectedItem = selectedItems;
              },
            ),
            DropDownTest(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RouletteButton(isSelectedItem: isSelectedItem),
      bottomNavigationBar: CmnBottomAppBar(),
    );
  }
}

/// ドロップダウンメニュー
class DropDown extends StatefulWidget {
  final Function(List<String>) onSelected;

  const DropDown({super.key, required this.onSelected});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<String> isSelectedItem = Entertainment.entertainmentList;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<List<String>>(
      items: const [
        DropdownMenuItem(
            value: Entertainment.entertainmentList, child: Text('エンタメ')),
        DropdownMenuItem(
            value: FoodAndDrink.foodAndDrinkList, child: Text('飲食')),
        DropdownMenuItem(value: Shopping.shoppingList, child: Text('ショッピング')),
        DropdownMenuItem(
            value: HealthAndWellness.healthAndWellnessList,
            child: Text('健康・美容')),
        DropdownMenuItem(value: Services.servicesList, child: Text('サービス')),
        DropdownMenuItem(
            value: Transportation.transportationList, child: Text('交通')),
        DropdownMenuItem(
            value: EducationAndGovernment.educationAndGovernmentList,
            child: Text('教育・公共')),
        DropdownMenuItem(
            value: Miscellaneous.miscellaneousList, child: Text('その他')),
      ],
      value: isSelectedItem,
      onChanged: (List<String>? newValue) {
        setState(
          () {
            isSelectedItem = newValue!;
          },
        );
        widget.onSelected(isSelectedItem!);
      },
    );
  }
}

class DropDownTest extends ConsumerWidget {
  const DropDownTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testRef = ref.watch(testNotifierProvider);

    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        ref.read(testNotifierProvider.notifier).updateState(value!);
      },
      items: testRef.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
