//TODO: 全体マップ画面
import 'package:flutter/material.dart';
import 'package:randomspotfinder/models/dto/nearby_search_result/nearby_search_result.dart';

import '../../../domain/features/services/location/location_service.dart';
import '../error/error_screen.dart';
import 'map_result_screen.dart';

///マップ事態に検索機能はないが、ピンを打ったりできるマップを表示させたい画面
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late String lat;
  late String long;
  late List<NearBySearchResult> searchResult = [];

  late String locationMessage = 'WAITING FOR LOCATION...';
  final LocationService _locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Map'),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final currentLocation =
                        await _locationService.getCurrentLocation();
                    searchResult = await _locationService.searchNearBySpot();
                    lat = '${currentLocation.latitude}';
                    long = '${currentLocation.longitude}';
                    setState(() {
                      locationMessage = 'Latitude: $lat, Longitude: $long';
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MapResult(searchResult: searchResult)));
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
      ),
    );
  }
}
