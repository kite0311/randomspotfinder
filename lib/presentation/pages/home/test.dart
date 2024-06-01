import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test.g.dart';

@riverpod
class TestNotifier extends _$TestNotifier {
  @override
  List<String> build() {
    return ['エンタメ', '飲食', 'ショッピング', '健康・美容', 'サービス', '交通', '教育・公共', 'その他'];
  }

  void updateState(String s) {
    state = s as List<String>;
  }
}
