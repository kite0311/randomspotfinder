import 'dart:convert';
import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:randomspotfinder/constant/types.dart';

import '../../../../constant/direction.dart';
import '../../../../models/dto/nearby_search_result/nearby_search_result.dart';
import 'location_updator_service.dart';

/*
 * 現在地の取得と近くの施設を検索するクラス
 * @return Position 現在地の緯度経度
 */
class LocationService {
  // PlacesAPIのURL
  final String baseUrlByNearBySearch = dotenv.get('BASE_URL_BY_NEARBY_SEARCH');

  // APIキー
  final String apikey = dotenv.get('API_KEY');

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
   * @return List<NearBySearchResult> 検索結果
   * */
  Future<List<NearBySearchResult>> searchNearBySearchResultSpot() async {
    Position position = await getCurrentLocation();
    const String distance = '1500';
    String type = FoodAndDrink.RESTAURANT;
    String currentLocation = '${position.latitude},${position.longitude}';

    List<NearBySearchResult> allNearBySpot = [];

    // 現在地から検索
    allNearBySpot.addAll(
        await searchNearByUsingLocation(currentLocation, type, distance));

    // 検索範囲を拡大するため、現在地から起点に東西南北に検索範囲を拡大
    for (var dir in Direction.values) {
      String setLocation = LocationUpdaterService.calculateNewPosition(
        position.latitude,
        position.longitude,
        dir,
        double.parse(distance),
      );
      // 範囲拡大した地点から検索
      allNearBySpot
          .addAll(await searchNearByUsingLocation(setLocation, type, distance));
    }

    return checkDistinct(allNearBySpot);
  }

  /*
   * PlacesAPIを叩いて検索結果を取得する
   * @return List<NearBySearchResult> 検索結果
   */
  Future<List<NearBySearchResult>> searchNearByUsingLocation(
      String location, String type, String distance) async {
    String responseUrl =
        '$baseUrlByNearBySearch?location=$location&radius=$distance&type=$type&key=$apikey';
    return await searchNearBy(responseUrl);
  }

  /*
  * PlacesAPIの検索結果を元に PlacePhoto APIを叩いて画像データを取得する
  */
  Future<Image> fetchPhoto(NearBySearchResult searchRes) async {
    //TODO 画像取得
    return 'Hello' as Image;
  }

  /*
   * PlacesAPIを叩いて検索結果を取得する
   * @return List<NearBySearchResult> 検索結果
   */
  Future<List<NearBySearchResult>> searchNearBy(
      // 近くの施設を検索 検索範囲を広げるため、現在地から東西南北に$radius km の地点からradius半径で検索する。
      String responseUrl) async {
    var response = await http.get(Uri.parse(responseUrl));
    if (response.statusCode == 200) {
      List<NearBySearchResult> nearBySpot = [];
      // debugPrint(response.body);
      var data = jsonDecode(response.body);

      if (data['results'] != null) {
        data['results'].forEach((value) {
          nearBySpot.add(NearBySearchResult.fromJson(value));
        });
      }
      return nearBySpot;
    } else {
      throw Exception('Failed to load data');
    }
  }

  /*
   * 検索結果の重複チェック
   * @return List<NearBySearchResult> 重複を除いた検索結果
   */
  List<NearBySearchResult> checkDistinct(List<NearBySearchResult> allNearBySpot) {
    List<NearBySearchResult> allNearBySpotDistinct = [];
    Map<String, NearBySearchResult> distinctMap = {};

    for (var spot in allNearBySpot) {
      if (!distinctMap.containsKey(spot.name)) {
        distinctMap[spot.name] = spot;
      }
    }

    return allNearBySpotDistinct = distinctMap.values.toList();
  }
}
