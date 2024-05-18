import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:randomspotfinder/constant/types.dart';

import '../../../../models/nearby_api/nearby.dart';


///現在地を取得する処理
class LocationService {

  Future<Position> getCurrentLocation() async {
    /// 位置情報の取得を許可するかどうかの確認
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  /// 近くの施設を検索
  /// TODO　現在は仮で現在地空半径500m以内の施設を検索させる
  Future<List<NearBy>> e() async {
    Position position = await getCurrentLocation();
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    ///TODO APIキーを設定 実行時のみコピペ コミットはしない
    String apikey = 'AIzaSyDmHm49W72reh12HZA4KQdSY93jxJIubYM';
    String currentLocation = '${position.latitude},${position.longitude}';
    String radius = '1500';
    String type = Entertainment.PARK;

    String responseUrl =
        '$baseUrl?location=$currentLocation&radius=$radius&type=$type&key=$apikey';

    return searchNearBy(responseUrl);
  }
}

Future<List<NearBy>> searchNearBy(
    String responseUrl) async {
  var response = await http.get(Uri.parse(responseUrl));
  if (response.statusCode == 200) {
    List<NearBy> restaurants = [];
    debugPrint(response.body);
    var data = jsonDecode(response.body);

    if (data['results'] != null) {
      data['results'].forEach((value) {
        restaurants.add(NearBy.fromJson(value));
      });
    }
    return restaurants;
  } else {
    throw Exception('Failed to load data');
  }
}
