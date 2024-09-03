import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/prefs.dart';

part 'token_state.g.dart';

@riverpod
class TokenState extends _$TokenState {
  TokenState() : super();

  @override
  String? build() {
    final prefsStorage = ref.read(prefsProvider).requireValue;
    return prefsStorage.getString('token');
  }

  // refresh token
  void refreshToken() {
    final prefsStorage = ref.read(prefsProvider).requireValue;
    final newToken = prefsStorage.getString('token');
    if (newToken != null && newToken != state) {
      state = newToken;
    } else if (newToken == null) {
      state = "";
    }
  }
}
