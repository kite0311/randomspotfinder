import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'example.g.dart';

@RestApi(baseUrl: 'https://maps.googleapis.com/')
abstract class PlacesApiClient {
  factory PlacesApiClient(Dio dio, {String baseUrl}) = _PlacesApiClient;

  @GET('/maps/api/place/nearbysearch/json')
  Future<List<Task>> getLocation(

      );
}

@JsonSerializable()
class Task {
  const Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String? id;
  final String? name;
  final String? avatar;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}