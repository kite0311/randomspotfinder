import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:randomspotfinder/constant/types.dart';

import '../../../config.dart';
import '../../../models/nearby_api/nearby.dart';
import '../../types/direction.dart';
import 'location_updator.dart';

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
    String apikey = API_KEY;

    // 検索範囲を設定
    String distance = '1500';

    // 検索する施設の種類を設定
    String type = FoodAndDrink.BAKERY;

    // 現在地の緯度経度
    String currentLocation = '${position.latitude},${position.longitude}';

    // API検索結果を格納するリスト
    List<NearBy> allNearBySpot = [];

    // 検索範囲を拡大するため、現在地から起点に東西南北に検索範囲を拡大
    for (var dir in Direction.values) {
      final String setLocation = LocationUpdater.calculateNewPosition(
        position.latitude,
        position.longitude,
        dir,
        double.parse(distance),
      );

      String responseUrl = '$baseUrl?location=$setLocation&radius=$distance&type=$type&key=$apikey';

      //各方角の検索結果を集計
      List<NearBy> results = await searchNearBy(responseUrl);
      allNearBySpot.addAll(results);

    }
    var allNearBySpotDistinct = allNearBySpot.toSet().toList();

    return allNearBySpotDistinct;
  }

  /*
   * PlacesAPIを叩いて検索結果を取得する
   * @return List<NearBy> 検索結果
   */
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
