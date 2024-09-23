import 'package:dio/dio.dart';
import '../../../../../core/resources/api_service.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/user_model_entity.dart';

class AuthServiceProvider {
  final ApiServiceProvider apiServiceProvider = ApiServiceProvider();

// Function to get user data by userId
  Stream<DataState<CurrentUserEntity>> watchCurrentUserData(String userId) {
    try {
      return apiServiceProvider.watchCurrentUserData(
        userId,
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign in
  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return apiServiceProvider.signInWithEmailAndPassword(email, password);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign up
  Future<Response> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return apiServiceProvider.signUpWithEmailAndPassword(email, password);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  //check token
  Future<Response> checkToken(String userId) async {
    try {
      return apiServiceProvider.checkToken(userId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}
