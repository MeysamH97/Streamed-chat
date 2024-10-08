import 'package:chat_by_socket_samle/features/auth_service/data/models/current_user_model.dart';
import 'package:chat_by_socket_samle/features/auth_service/data/models/medel_converter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/user_model_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_service_provider.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthServiceProvider authServiceProvider;

  AuthRepositoryImpl(this.authServiceProvider);

  @override
  Stream<DataState<CurrentUserEntity>> fetchCurrentUserData(String userId)  {
    return authServiceProvider.watchCurrentUserData(userId);
  }

  @override
  Future<DataState<CurrentUserEntity>> fetchUserDataWithSignIn(String email, String password) async {
    try {
      Response response =
          await authServiceProvider.signInWithEmailAndPassword(email, password);

      if (response.data != null) {
        CurrentUserEntity currentUserData = currentUserToEntity(
            CurrentUserModel.fromJson(response.data['data']));

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
  Future<DataState<CurrentUserEntity>> fetchUserDataWithSignUp(String email, String password) async {
    try {
      print('Send request for user data');
      Response response =
          await authServiceProvider.signUpWithEmailAndPassword(email, password);
      print('back request for user data');
      if (response.data != null) {
        CurrentUserEntity newUserData = await currentUserToEntity(
            CurrentUserModel.fromJson(response.data['data']));
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

  // ذخیره توکن در SharedPreferences
  Future<void> saveLoginData(String userId, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    await prefs.setString('auth_token', token);
  }

}
