import 'dart:convert';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:randomspotfinder/constant/types.dart';
import 'package:dotenv/dotenv.dart';

import '../../../../config.dart';
import '../../../../models/nearby/nearby.dart';
import '../../../types/direction.dart';
import 'location_updator.dart';

/*
 * 現在地の取得と近くの施設を検索するクラス
 */
class LocationService {

  Future loadEnv () async {
    await dotenv.load(fileName: '.env');
  }


  // PlacesAPIのURL
  final String baseUrlByNearBySearch =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

  // APIキー
  final String apikey = API_KEY;

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
   * */
  Future<List<NearBy>> searchNearBySpot() async {
    // 現在地を取得
    Position position = await getCurrentLocation();

    // 検索範囲を設定
    final String distance = '1500';

    // 検索する施設の種類を設定
    String type = FoodAndDrink.RESTAURANT;

    // 現在地の緯度経度
    String currentLocation = '${position.latitude},${position.longitude}';

    // API検索結果を格納するリスト
    List<NearBy> allNearBySpot = [];
    // 結果返却用リスト
    List<NearBy> allNearBySpotDistinct = [];

    //　現在地から規定範囲内で検索
    String responseUrl =
        '$baseUrlByNearBySearch?location=$currentLocation&radius=$distance&type=$type&key=$apikey';
    List<NearBy> results = await searchNearBy(responseUrl);
    allNearBySpot.addAll(results);

    // 検索範囲を拡大するため、現在地から起点に東西南北に検索範囲を拡大
    for (var dir in Direction.values) {
      final String setLocation = LocationUpdater.calculateNewPosition(
        position.latitude,
        position.longitude,
        dir,
        double.parse(distance),
      );

      String responseUrl =
          '$baseUrlByNearBySearch?location=$setLocation&radius=$distance&type=$type&key=$apikey';

      //各方角の検索結果を集計
      List<NearBy> results = await searchNearBy(responseUrl);
      allNearBySpot.addAll(results);
    }
    allNearBySpotDistinct = checkDistinct(allNearBySpot);

    return allNearBySpotDistinct;
  }

  /*
  * PlacesAPIの検索結果を元に
  * PlacePhoto APIを叩いて画像データを取得する
  *  */
  Future<Image> fetchPhoto(NearBy searchRes) async {
    //TODO 画像取得
    return 'Hello' as Image;
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

  // 検索結果の重複チェック
  List<NearBy> checkDistinct(List<NearBy> allNearBySpot) {
    List<NearBy> allNearBySpotDistinct = [];
    Map<String, NearBy> distinctMap = {};

    for (var spot in allNearBySpot) {
      if (!distinctMap.containsKey(spot.name)) {
        distinctMap[spot.name] = spot;
      }
    }

    return allNearBySpotDistinct = distinctMap.values.toList();
  }
}
