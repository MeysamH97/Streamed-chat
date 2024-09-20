import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

String baseUrl = 'https://296e-13-60-212-218.ngrok-free.app';  // Sever address

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Dio get dio => _dio;
}

class ApiServiceProvider {
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
  Future<Response> signInWithEmailAndPassword(String email, String password) async {
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
  Future<Response> signUpWithEmailAndPassword(String email, String password) async {
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

  // Function to get chat data by chatId
  Future<Response> getChatData(String chatId, String token) async {
    try {
      final response = await _apiService.dio.get(
        '/getChat/$chatId',
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

  // Function to get message data by messageId
  Future<Response> getMessageData(String messageId, String token) async {
    try {
      final response = await _apiService.dio.get(
        '/getMessage/$messageId',
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
}

class SocketProvider {
  IO.Socket? connectSocket() {

    return IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });
  }
}
