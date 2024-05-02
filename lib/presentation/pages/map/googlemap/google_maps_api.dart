import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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
  /// TODO　現在は仮で現在地空半径500m以内のレストランを検索させる
  Future<void> searchNearByRestaurant() async {
    Position position = await getCurrentLocation();
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    ///TODO APIキーを設定 実行時のみコピペ コミットはしない
    String apikey = 'AIzaSyDmHm49W72reh12HZA4KQdSY93jxJIubYM';
    String currentLocation = '${position.latitude},${position.longitude}';
    String radius = '1500';
    String type = 'restaurant';

    String responseUrl =
        '$baseUrl?location=$currentLocation&radius=$radius&type=$type&key=$apikey';

    searchNearByRestaurantByJson(responseUrl);
  }
}

/// 仮のmodelクラス
class Restaurant {
  final String? name;
  final String? location;
  final String? rating;

  Restaurant({
    required this.name,
    required this.location,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      location: json['location'],
      rating: json['rating'] != null ? json['rating'].toString() : '0',
    );
  }
}

Future<List<Restaurant>> searchNearByRestaurantByJson(
    String responseUrl) async {
  var response = await http.get(Uri.parse(responseUrl));
  if (response.statusCode == 200) {
    List<Restaurant> restaurants = [];
    debugPrint(response.body);
    var data = jsonDecode(response.body);

    if (data['results'] != null) {
      data['results'].forEach((restaurant) {
        restaurants.add(Restaurant.fromJson(restaurant));
      });
    }
    print(restaurants);
    return restaurants;
  } else {
    throw Exception('Failed to load data');
  }
}
