import 'package:dio/dio.dart';

import 'my_http_client.dart';

class DioCliente implements IHttpClient {
  final dio = Dio();

  @override
  Future<Response> get(String url, Map<String, dynamic> queryParameters) {
    final response = dio.get(url, queryParameters: queryParameters);

    return response;
  }
}
