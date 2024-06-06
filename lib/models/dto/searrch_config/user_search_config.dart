import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_search_config.freezed.dart';

part 'user_search_config.g.dart';

@freezed
class UserSearchConfig with _$UserSearchConfig {
  const factory UserSearchConfig({
    /// 検索範囲
    required int distance,

    /// 検索ジャンル
    required String searchGenre,
  }) = _UserSearchConfig;

  factory UserSearchConfig.fromJson(Map<String, dynamic> json) =>
      _$UserSearchConfigFromJson(json);
}
