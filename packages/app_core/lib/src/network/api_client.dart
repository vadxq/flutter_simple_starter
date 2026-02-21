import 'package:dio/dio.dart';

import '../env/app_env.dart';

class ApiClient {
  ApiClient({
    required AppConfig config,
    Dio? dio,
  }) : _dio =
            dio ??
            Dio(
              BaseOptions(
                baseUrl: config.apiBaseUrl,
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ),
            );

  final Dio _dio;

  Future<List<dynamic>> getList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return response.data ?? <dynamic>[];
  }

  Future<Map<String, dynamic>> getObject(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return response.data ?? <String, dynamic>{};
  }
}
