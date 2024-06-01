//TODO goolemap apiを叩いたあとに取得結果を表示する画面
import 'package:flutter/material.dart';

import '../../../domain/features/services/location/location_service.dart';
import '../../../models/nearby/nearby.dart';

class MapResult extends StatelessWidget {
  const MapResult({super.key, required this.searchResult});

  final List<NearBy> searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索結果'),
      ),
      body: Center(
        child: searchList(searchResult: searchResult),
      ),
    );
  }
}

class searchList extends StatelessWidget {
  const searchList({super.key, required this.searchResult});

  final List<NearBy> searchResult;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        return ListTile(
          isThreeLine: true,
          title: Text('${index + 1}.${searchResult[index].name}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(searchResult[index].vicinity ?? '住所なし'),
              Text('評価：' + searchResult[index].rating.toString() ?? '評価なし'),
              Text(searchResult[index].priceLevel.toString() ?? '価格なし'),
            ],
          ),
          subtitleTextStyle: const TextStyle(color: Colors.black),
        );
      },
    );
  }
}


class TestImages extends StatelessWidget {
  TestImages({Key? key}) : super(key: key) {
    _locationService.fetchPhoto('ChIJN1t_tDeuEmsRUsoyG83frY4' as NearBy);
  }
  final LocationService _locationService = LocationService();

  get image => null;
  
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/food.jpg');
  }
}

