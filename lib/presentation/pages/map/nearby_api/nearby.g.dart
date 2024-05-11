// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearByImpl _$$NearByImplFromJson(Map<String, dynamic> json) => _$NearByImpl(
      businessStatus: json['businessStatus'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['iconBackgroundColor'] as String?,
      iconMaskBaseUri: json['iconMaskBaseUri'] as String?,
      name: json['name'] as String,
      openingHours: json['openingHours'] == null
          ? null
          : OpeningHours.fromJson(json['openingHours'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['placeId'] as String,
      plusCode: json['plusCode'] == null
          ? null
          : PlusCode.fromJson(json['plusCode'] as Map<String, dynamic>),
      priceLevel: (json['priceLevel'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'] as String?,
      scope: json['scope'] as String?,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      userRatingsTotal: (json['userRatingsTotal'] as num?)?.toInt(),
      vicinity: json['vicinity'] as String?,
    );

Map<String, dynamic> _$$NearByImplToJson(_$NearByImpl instance) =>
    <String, dynamic>{
      'businessStatus': instance.businessStatus,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'iconBackgroundColor': instance.iconBackgroundColor,
      'iconMaskBaseUri': instance.iconMaskBaseUri,
      'name': instance.name,
      'openingHours': instance.openingHours,
      'photos': instance.photos,
      'placeId': instance.placeId,
      'plusCode': instance.plusCode,
      'priceLevel': instance.priceLevel,
      'rating': instance.rating,
      'reference': instance.reference,
      'scope': instance.scope,
      'types': instance.types,
      'userRatingsTotal': instance.userRatingsTotal,
      'vicinity': instance.vicinity,
    };
