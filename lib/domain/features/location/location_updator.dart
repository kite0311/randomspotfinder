/*
 * 指定された距離と方向に基づいて位置を更新する。
 */
import 'dart:math';

import '../../types/direction.dart';

class LocationUpdater {
  // 地球上での緯度1度当たりの距離（メートル単位）
  static const double metersPerDegreeLatitude = 111000;

  // 地球の半径（単位: km）
  static const double earthRadius = 6371.0;

  // 緯度の変化を計算
  static double distanceToLatitudeChange(double distance) {
    return distance / metersPerDegreeLatitude;
  }

  // 経度の変化を計算
  static double calculateLongitudeChange(double latitude, double distance) {
    double latitudeInRadians = latitude * (pi / 180);
    double longitudeDistanceAtLatitude =
        cos(latitudeInRadians) * earthRadius * (pi / 180);
    return distance / longitudeDistanceAtLatitude;
  }

  // 方角に応じて新しい位置を計算
  static String calculateNewPosition(
      double latitude, double longitude, Direction direction, double distance) {
    double newLatitude = latitude;
    double newLongitude = longitude;

    switch (direction) {
      case Direction.north:
        newLatitude += distanceToLatitudeChange(distance);
        break;
      case Direction.south:
        newLatitude -= distanceToLatitudeChange(distance);
        break;
      case Direction.east:
        newLongitude += calculateLongitudeChange(latitude, distance);
        break;
      case Direction.west:
        newLongitude -= calculateLongitudeChange(latitude, distance);
        break;
    }

    return '$newLatitude,$newLongitude';
  }
}
