import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:randomspotfinder/constant/types.dart';

import '../../../../config.dart';
import '../../../../models/nearby_api/nearby.dart';

// 方角を指定するための列挙型
enum Direction { north, south, east, west }

/*
 * 現在地の取得と近くの施設を検索するクラス
 */
class LocationService {
  Future<Position> getCurrentLocation() async {
    // 位置情報の取得を許可するかどうかの確認
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

  /*
   * 近くの施設を検索する
   * @return List<NearBy> 検索結果
   * Position position 現在地の緯度経度
   * String type 検索する施設の種類
   * String distance 検索範囲
   * String baseUrl PlacesAPIのURL
   * String apikey APIキー
   * String currentLocation 現在地の緯度経度
   * String northLocation 現在地から北の緯度経度
   * String eastLocation 現在地から東の緯度経度
   * String southLocation 現在地から南の緯度経度
   * String westLocation 現在地から西の緯度経度
   * String responseUrl 検索結果のURL
   * */
  Future<List<NearBy>> searchNearBySpot() async {
    // 現在地を取得
    Position position = await getCurrentLocation();

    // PlacesAPIのURL
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    //TODO APIキーを設定 設定方法を考慮する
    String apikey = API_KEY;

    // 検索範囲を設定
    String distance = '1500';

    // 検索する施設の種類を設定
    String type = FoodAndDrink.BAKERY;

    // 現在地の緯度経度
    String currentLocation = '${position.latitude},${position.longitude}';

    // 緯度経度の変化量を計算
    double latitudeChange = distanceToLatitudeChange(double.parse(distance));
    double longitudeChange =
        calculateLongitudeChange(position.latitude, double.parse(distance));

    // 検索範囲を拡大するため、現在地から起点に東西南北に県s買う範囲拡大
    String northLocation = '${position.latitude + 0.01},${position.longitude}';
    String eastLocation = '${position.latitude},${position.longitude + 0.01}';
    String southLocation = '${position.latitude - 0.01},${position.longitude}';
    String westLocation = '${position.latitude},${position.longitude - 0.01}';

    String responseUrl =
        '$baseUrl?location=$currentLocation&radius=$distance&type=$type&key=$apikey';

    return searchNearBy(responseUrl);
  }

  Future<List<NearBy>> searchNearBy(
      // 近くの施設を検索 検索範囲を広げるため、現在地から東西南北に$radius km の地点からradius半径で検索する。
      String responseUrl) async {
    var response = await http.get(Uri.parse(responseUrl));
    if (response.statusCode == 200) {
      List<NearBy> nearBySpot = [];
      // debugPrint(response.body);
      var data = jsonDecode(response.body);

      if (data['results'] != null) {
        data['results'].forEach((value) {
          nearBySpot.add(NearBy.fromJson(value));
        });
      }
      return nearBySpot;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class LocationUpdater {

}

//TODO 緯度経度の計算には複雑な処理が伴うため、ver1.0.0では簡易的に実装する。
/*
 * 検索起点を新たに設定するため、緯度の値を計算する。
 * 検索距離/111000m = 入力値の分の緯度
 */
double distanceToLatitudeChange(double distance) {
  // 地球上での緯度1度当たりの距離（メートル単位）
  const double metersPerDegree = 111000;

  // 移動距離を緯度の変化（度単位）に変換
  return distance / metersPerDegree;
}

/*
 * 検索起点を新たに設定するため、軽度の値を計算する。
 */
double calculateLongitudeChange(double latitude, double radius) {
  // 地球の半径（単位: km）
  const double earthRadius = 6371.0;

  // 移動距離（単位: km）
  double distance = radius;

  // 緯度をラジアンに変換
  double latitudeInRadians = latitude * (pi / 180);

  // 緯度における経度1度あたりの距離を計算
  double longitudeDistanceAtLatitude =
      cos(latitudeInRadians) * earthRadius * (pi / 180);
  debugPrint(longitudeDistanceAtLatitude.toString());
  return longitudeDistanceAtLatitude;
}
