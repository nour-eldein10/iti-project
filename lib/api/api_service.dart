import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com',
    validateStatus: (status) => status! < 500,
  ));

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response.data['message'] ?? 'Login failed';
      }
    } catch (e) {
      throw 'Login error: ${e.toString()}';
    }
  }

  void close() => _dio.close();
}