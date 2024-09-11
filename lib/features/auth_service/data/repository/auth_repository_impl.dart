import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_service_provider.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthServiceProvider authServiceProvider;

  AuthRepositoryImpl(this.authServiceProvider);

  @override
  Future<DataState<UserModelEntity>> fetchCurrentUserData(String userId) async {
    try {
      String token = await _getToken() ?? '';
      Response response = await authServiceProvider.checkToken(userId, token);

      if (response.data == null) {
        return DataFailed('Please check your connection');
      }

      if (response.data['error'] != null) {
        return DataFailed('error: ${response.data['error']}');
      }

      Response newResponse =
          await authServiceProvider.getUserData(userId, token);
      UserModelEntity currentUserData =
          UserModel.fromJson(newResponse.data).toEntity();

      return DataSuccess(currentUserData);
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserModelEntity>> fetchUserDataWithSignIn(
      String email, String password) async {
    try {
      Response response =
          await authServiceProvider.signInWithEmailAndPassword(email, password);

      if (response.data != null) {
        UserModelEntity currentUserData =
            UserModel.fromJson(response.data['data']).toEntity();

        final token = response.data['token'];
        if (token != null) {
          await saveLoginData(currentUserData.id, token); // ذخیره توکن
        }

        return DataSuccess(currentUserData);
      } else {
        return DataFailed('User data not found.');
      }
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserModelEntity>> fetchUserDataWithSignUp(
      String email, String password) async {
    try {
      print('Send request for user data');
      Response response =
          await authServiceProvider.signUpWithEmailAndPassword(email, password);
      print('back request for user data');
      if (response.data != null) {
        UserModelEntity newUserData =
            UserModel.fromJson(response.data['data']).toEntity();
        print('preparing user data');
        return DataSuccess(newUserData);
      } else {
        print('null data returned');
        return DataFailed('User creation failed.');
      }
    } catch (e) {
      print('Error : ${e.toString()}');
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<String>> signOut(String userId) async {
    try {
      Response response = await authServiceProvider.signOut(userId);
      if (response.data != null) {
        await removeLoginData();
        return DataSuccess(response.data['message']);
      } else {
        return DataFailed('Sign Out failed.');
      }
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  // ذخیره توکن در SharedPreferences
  Future<void> saveLoginData(String userId, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setString('auth_token', token);
  }

  // بازیابی توکن از SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // حذف توکن از SharedPreferences
  Future<void> removeLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('auth_token');
  }
}
