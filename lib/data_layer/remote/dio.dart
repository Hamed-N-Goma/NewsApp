import 'package:dio/dio.dart';

class MyDio {
  static late Dio dio;
  static initial() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true));
  }

  static Future<Response> gitData({
    required String pathUrl,
    required Map<String, dynamic> queryParameters,
  }) async {
    return await dio.get(pathUrl, queryParameters: queryParameters);
  }
}
