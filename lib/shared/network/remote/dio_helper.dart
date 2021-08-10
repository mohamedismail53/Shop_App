import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          "key": "Content-Type",
          "value": "application/json",
          "type": "text",
          "lang": "en",
        },
        receiveDataWhenStatusError: true,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    @required Map<String, dynamic> query,
    String lang = "en",
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String lang = "en",
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
