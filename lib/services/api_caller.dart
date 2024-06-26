import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCaller {
  // static const baseUrl = 'http://127.0.0.1:3000';
  static const baseUrl = 'http://127.0.0.1:3001';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response =
          await _dio.get('$baseUrl/$endpoint', queryParameters: params);
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      return response.data.toString();
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

  Future<String> post(String endpoint,
      {required Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post('$baseUrl/$endpoint', data: params);
      debugPrint(response.data.toString());
      return response.data.toString();
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}
