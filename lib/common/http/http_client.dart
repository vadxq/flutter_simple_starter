import 'package:dio/dio.dart';

import '../../pages/detail/models/detail.dart';
import '../../pages/login/models/login.dart';

typedef ApiClientException = DioException;
typedef ApiClientResponse<T> = Response<T>;
typedef ApiClientRequestOptions = RequestOptions;
typedef _ResponseData = Map<String, Object?>;

extension ApiClientExceptionX on ApiClientException {
  String? get responseMessage => response?.data?['message'] as String?;
}

class ApiClient {
  static final BaseOptions _defaultOptions = BaseOptions(
    baseUrl: 'https://api.vadxq.com',
  );

  final Dio _httpClient;

  // default options.
  ApiClient() : _httpClient = Dio(_defaultOptions);

  // receive the token
  ApiClient.withToken(String token)
      : _httpClient = Dio(
          _defaultOptions.copyWith()
            ..headers['Authorization'] = 'Bearer $token',
        );

  @override
  String toString() {
    return "ApiClient(_httpClient.options.headers['Authorization']: ${_httpClient.options.headers['Authorization']})";
  }

  Future<String> login(Login data) async {
    final response = await _httpClient.post(
      '/auth/login',
      data: {
        ...data.toJson(),
        'expiresInMins': 43200,
      },
    );
    return response.data['token'] as String;
  }

  Future<Detail> fetchPostDetail(id) async {
    final response = await _httpClient.get('/detail/$id');
    return Detail.fromJson(response.data as _ResponseData);
  }
}
