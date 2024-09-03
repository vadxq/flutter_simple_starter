import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../states/auth/token_state.dart';
import 'http_client.dart';

part 'http_service.g.dart';

@riverpod
ApiClient apiService(ApiServiceRef ref) {
  final token = ref.watch(tokenStateProvider);

  final ApiClient client;

  client = token != null ? ApiClient.withToken(token) : ApiClient();
  ref.keepAlive();

  return client;
}

