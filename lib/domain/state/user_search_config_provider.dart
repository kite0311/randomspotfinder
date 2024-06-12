import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:randomspotfinder/models/dto/searrch_config/user_search_config.dart';

final userSearchConfigProvider =
    StateNotifierProvider<UserSearchConfigNotifier, UserSearchConfig>(
  (ref) => UserSearchConfigNotifier(),
);

class UserSearchConfigNotifier extends StateNotifier<UserSearchConfig> {
  UserSearchConfigNotifier() : super(UserSearchConfig(distance: 0, genre: ''));

  void updateDistance(double distance) {
    state = state.copyWith(distance: distance);
  }

  void updateGenre(String genre) {
    state = state.copyWith(genre: genre);
  }
}
