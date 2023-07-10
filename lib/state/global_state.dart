import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/global/global_model.dart';

class GlobalProviderNotifier extends StateNotifier<GlobalModel> {
  GlobalProviderNotifier()
      : super(const GlobalModel(
            token: '', freshToken: '', username: '', userId: 0));

  void reset() {
    state = state.copyWith(token: '', freshToken: '', username: '', userId: 0);
  }
}

final globalProvider =
    StateNotifierProvider<GlobalProviderNotifier, GlobalModel>((ref) {
  return GlobalProviderNotifier();
});
