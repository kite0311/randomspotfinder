// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearBy _$NearByFromJson(Map<String, dynamic> json) {
  return _NearBy.fromJson(json);
}

/// @nodoc
mixin _$NearBy {
  String? get businessStatus => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get iconBackgroundColor => throw _privateConstructorUsedError;
  String? get iconMaskBaseUri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OpeningHours? get openingHours => throw _privateConstructorUsedError;
  List<Photos>? get photos => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  PlusCode? get plusCode => throw _privateConstructorUsedError;
  int? get priceLevel => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  int? get userRatingsTotal => throw _privateConstructorUsedError;
  String? get vicinity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearByCopyWith<NearBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearByCopyWith<$Res> {
  factory $NearByCopyWith(NearBy value, $Res Function(NearBy) then) =
      _$NearByCopyWithImpl<$Res, NearBy>;
  @useResult
  $Res call(
      {String? businessStatus,
      Geometry? geometry,
      String? icon,
      String? iconBackgroundColor,
      String? iconMaskBaseUri,
      String name,
      OpeningHours? openingHours,
      List<Photos>? photos,
      String placeId,
      PlusCode? plusCode,
      int? priceLevel,
      double? rating,
      String? reference,
      String? scope,
      List<String> types,
      int? userRatingsTotal,
      String? vicinity});
}

/// @nodoc
class _$NearByCopyWithImpl<$Res, $Val extends NearBy>
    implements $NearByCopyWith<$Res> {
  _$NearByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessStatus = freezed,
    Object? geometry = freezed,
    Object? icon = freezed,
    Object? iconBackgroundColor = freezed,
    Object? iconMaskBaseUri = freezed,
    Object? name = null,
    Object? openingHours = freezed,
    Object? photos = freezed,
    Object? placeId = null,
    Object? plusCode = freezed,
    Object? priceLevel = freezed,
    Object? rating = freezed,
    Object? reference = freezed,
    Object? scope = freezed,
    Object? types = null,
    Object? userRatingsTotal = freezed,
    Object? vicinity = freezed,
  }) {
    return _then(_value.copyWith(
      businessStatus: freezed == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBackgroundColor: freezed == iconBackgroundColor
          ? _value.iconBackgroundColor
          : iconBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      iconMaskBaseUri: freezed == iconMaskBaseUri
          ? _value.iconMaskBaseUri
          : iconMaskBaseUri // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photos>?,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      plusCode: freezed == plusCode
          ? _value.plusCode
          : plusCode // ignore: cast_nullable_to_non_nullable
              as PlusCode?,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      vicinity: freezed == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearByImplCopyWith<$Res> implements $NearByCopyWith<$Res> {
  factory _$$NearByImplCopyWith(
          _$NearByImpl value, $Res Function(_$NearByImpl) then) =
      __$$NearByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? businessStatus,
      Geometry? geometry,
      String? icon,
      String? iconBackgroundColor,
      String? iconMaskBaseUri,
      String name,
      OpeningHours? openingHours,
      List<Photos>? photos,
      String placeId,
      PlusCode? plusCode,
      int? priceLevel,
      double? rating,
      String? reference,
      String? scope,
      List<String> types,
      int? userRatingsTotal,
      String? vicinity});
}

/// @nodoc
class __$$NearByImplCopyWithImpl<$Res>
    extends _$NearByCopyWithImpl<$Res, _$NearByImpl>
    implements _$$NearByImplCopyWith<$Res> {
  __$$NearByImplCopyWithImpl(
      _$NearByImpl _value, $Res Function(_$NearByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessStatus = freezed,
    Object? geometry = freezed,
    Object? icon = freezed,
    Object? iconBackgroundColor = freezed,
    Object? iconMaskBaseUri = freezed,
    Object? name = null,
    Object? openingHours = freezed,
    Object? photos = freezed,
    Object? placeId = null,
    Object? plusCode = freezed,
    Object? priceLevel = freezed,
    Object? rating = freezed,
    Object? reference = freezed,
    Object? scope = freezed,
    Object? types = null,
    Object? userRatingsTotal = freezed,
    Object? vicinity = freezed,
  }) {
    return _then(_$NearByImpl(
      businessStatus: freezed == businessStatus
          ? _value.businessStatus
          : businessStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      iconBackgroundColor: freezed == iconBackgroundColor
          ? _value.iconBackgroundColor
          : iconBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
      iconMaskBaseUri: freezed == iconMaskBaseUri
          ? _value.iconMaskBaseUri
          : iconMaskBaseUri // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHours?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photos>?,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      plusCode: freezed == plusCode
          ? _value.plusCode
          : plusCode // ignore: cast_nullable_to_non_nullable
              as PlusCode?,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      vicinity: freezed == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearByImpl implements _NearBy {
  const _$NearByImpl(
      {this.businessStatus,
      this.geometry,
      this.icon,
      this.iconBackgroundColor,
      this.iconMaskBaseUri,
      required this.name,
      this.openingHours,
      final List<Photos>? photos,
      required this.placeId,
      this.plusCode,
      this.priceLevel,
      this.rating,
      this.reference,
      this.scope,
      required final List<String> types,
      this.userRatingsTotal,
      this.vicinity})
      : _photos = photos,
        _types = types;

  factory _$NearByImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearByImplFromJson(json);

  @override
  final String? businessStatus;
  @override
  final Geometry? geometry;
  @override
  final String? icon;
  @override
  final String? iconBackgroundColor;
  @override
  final String? iconMaskBaseUri;
  @override
  final String name;
  @override
  final OpeningHours? openingHours;
  final List<Photos>? _photos;
  @override
  List<Photos>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String placeId;
  @override
  final PlusCode? plusCode;
  @override
  final int? priceLevel;
  @override
  final double? rating;
  @override
  final String? reference;
  @override
  final String? scope;
  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final int? userRatingsTotal;
  @override
  final String? vicinity;

  @override
  String toString() {
    return 'NearBy(businessStatus: $businessStatus, geometry: $geometry, icon: $icon, iconBackgroundColor: $iconBackgroundColor, iconMaskBaseUri: $iconMaskBaseUri, name: $name, openingHours: $openingHours, photos: $photos, placeId: $placeId, plusCode: $plusCode, priceLevel: $priceLevel, rating: $rating, reference: $reference, scope: $scope, types: $types, userRatingsTotal: $userRatingsTotal, vicinity: $vicinity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearByImpl &&
            (identical(other.businessStatus, businessStatus) ||
                other.businessStatus == businessStatus) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.iconBackgroundColor, iconBackgroundColor) ||
                other.iconBackgroundColor == iconBackgroundColor) &&
            (identical(other.iconMaskBaseUri, iconMaskBaseUri) ||
                other.iconMaskBaseUri == iconMaskBaseUri) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.plusCode, plusCode) ||
                other.plusCode == plusCode) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessStatus,
      geometry,
      icon,
      iconBackgroundColor,
      iconMaskBaseUri,
      name,
      openingHours,
      const DeepCollectionEquality().hash(_photos),
      placeId,
      plusCode,
      priceLevel,
      rating,
      reference,
      scope,
      const DeepCollectionEquality().hash(_types),
      userRatingsTotal,
      vicinity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearByImplCopyWith<_$NearByImpl> get copyWith =>
      __$$NearByImplCopyWithImpl<_$NearByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearByImplToJson(
      this,
    );
  }
}

abstract class _NearBy implements NearBy {
  const factory _NearBy(
      {final String? businessStatus,
      final Geometry? geometry,
      final String? icon,
      final String? iconBackgroundColor,
      final String? iconMaskBaseUri,
      required final String name,
      final OpeningHours? openingHours,
      final List<Photos>? photos,
      required final String placeId,
      final PlusCode? plusCode,
      final int? priceLevel,
      final double? rating,
      final String? reference,
      final String? scope,
      required final List<String> types,
      final int? userRatingsTotal,
      final String? vicinity}) = _$NearByImpl;

  factory _NearBy.fromJson(Map<String, dynamic> json) = _$NearByImpl.fromJson;

  @override
  String? get businessStatus;
  @override
  Geometry? get geometry;
  @override
  String? get icon;
  @override
  String? get iconBackgroundColor;
  @override
  String? get iconMaskBaseUri;
  @override
  String get name;
  @override
  OpeningHours? get openingHours;
  @override
  List<Photos>? get photos;
  @override
  String get placeId;
  @override
  PlusCode? get plusCode;
  @override
  int? get priceLevel;
  @override
  double? get rating;
  @override
  String? get reference;
  @override
  String? get scope;
  @override
  List<String> get types;
  @override
  int? get userRatingsTotal;
  @override
  String? get vicinity;
  @override
  @JsonKey(ignore: true)
  _$$NearByImplCopyWith<_$NearByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
