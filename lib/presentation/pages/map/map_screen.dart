//TODO: 全体マップ画面
import 'package:flutter/material.dart';
import '../error/error_screen.dart';
import 'googlemap/google_maps_api.dart';

///マップ事態に検索機能はないが、ピンを打ったりできるマップを表示させたい画面
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late String lat;
  late String long;

  late String locationMessage = 'WAITING FOR LOCATION...';
  final LocationService _locationService = LocationService();

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
              onPressed: () async {
                try {
                  final currentLocation = await _locationService.getCurrentLocation();
                  final search = await _locationService.searchNearByRestaurant();
                  lat = '${currentLocation.latitude}';
                  long = '${currentLocation.longitude}';
                  setState(() {
                    locationMessage = 'Latitude: $lat, Longitude: $long';
                  });
                } catch (e) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ErrorScreen(errorMessage: e.toString()),
                  ));
                }
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
