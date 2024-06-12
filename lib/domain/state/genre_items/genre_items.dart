import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genre_items.g.dart';

@riverpod
class GenreItemsNotifier extends _$GenreItemsNotifier {
  String? selectedItem;

  @override
  List<String> build() {
    return ['エンタメ', '飲食', 'ショッピング', '健康・美容', 'サービス', '交通', '教育・公共', 'その他'];
  }

  selectItem(String item) {
    selectedItem = item;
    state = [...state];
  }
}
