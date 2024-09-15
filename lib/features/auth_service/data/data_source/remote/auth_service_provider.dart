import 'package:dio/dio.dart';
import '../../../../../core/resources/api_service.dart';

class AuthServiceProvider {
  final ApiServiceProvider apiServiceProvider = ApiServiceProvider();

// Function to get user data by userId
  Future<Response> getUserData(String userId, String token) async {
    try {
      return  await apiServiceProvider.getUserData(userId, token);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign in
  Future<Response> signInWithEmailAndPassword(String email, String password) async {
    try {
      return apiServiceProvider.signInWithEmailAndPassword(email, password);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign up
  Future<Response> signUpWithEmailAndPassword(String email, String password) async {
    try {
      return apiServiceProvider.signUpWithEmailAndPassword(email, password);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Function to check if the token is valid
  Future<Response> checkToken(String userId, String token ) async {
    try {
      return apiServiceProvider.checkToken(userId, token);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Future<Response> getChatData(String chatId, String token) async {
    try {
      return  await apiServiceProvider.getChatData(chatId, token);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}
