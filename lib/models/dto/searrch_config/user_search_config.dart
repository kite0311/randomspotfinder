import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_search_config.freezed.dart';
part 'user_search_config.g.dart';

@freezed
class UserSearchConfig with _$UserSearchConfig {
  const factory UserSearchConfig({
    /// 検索範囲
    required double distance,

    /// 検索ジャンル
    required String genre,
  }) = _UserSearchConfig;

  factory UserSearchConfig.fromJson(Map<String, dynamic> json) =>
      _$UserSearchConfigFromJson(json);
}
