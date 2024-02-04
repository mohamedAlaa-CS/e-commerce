import 'package:dio/dio.dart';
import 'package:e_commerce/injections.dart';

class ApiServices {
  static Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    Response response = await getIt.get<Dio>().get(
          endPoint,
          data: data,
          queryParameters: query,
        );
    return response.data;
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    Response response = await getIt.get<Dio>().get(
          endPoint,
          data: data,
          queryParameters: query,
        );
    return response.data;
  }
}
