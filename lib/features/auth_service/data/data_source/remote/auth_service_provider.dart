import 'package:dio/dio.dart';
import '../../../../../core/resources/api_service.dart';

class AuthServiceProvider {
  final ApiService _apiService = ApiService();

// Function to get user data by userId
  Future<Response> getUserData(String userId, String token) async {
    try {
      final response = await _apiService.dio.get(
        '/getUser/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // ارسال توکن در هدر
          },
        ),
      );
      return response; // بازگرداندن داده‌ها
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign in
  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _apiService.dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign up
  Future<Response> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      print('start api call');
      final response = await _apiService.dio.post(
        '/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('sign up done');
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign out
  Future<Response> signOut(String userId) async {
    try {
      final response = await _apiService.dio.post(
        '/signout',
        data: {
          'userId': userId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Function to check if the token is valid
  Future<Response> checkToken(String userId, String token ) async {
    try {
      final response = await _apiService.dio.get(
        '/checkToken',
        data: {
          'userId': userId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // ارسال توکن در هدر
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}
