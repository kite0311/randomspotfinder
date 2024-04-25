//TODO: 全体マップ画面
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

///マップ事態に検索機能はないが、ピンを打ったりできるマップを表示させたい画面
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late String lat;
  late String long;

  late String locationMessage = 'WAITING FOR LOCATION...';

  /// 現在地を取得する
  Future<Position> _getCurrentLocation() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Map'),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'Latitude: $lat, Longitude: $long';
                  });
                });
              },
              child: Text('Get Current Location'),
            ),
            Visibility(
              visible: locationMessage.isNotEmpty,
              child: Text(locationMessage),
            ),
          ],
        ),
      ),
    );
  }
}
