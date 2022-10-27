import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(String url, Map<String, dynamic> queryParameters);
}
