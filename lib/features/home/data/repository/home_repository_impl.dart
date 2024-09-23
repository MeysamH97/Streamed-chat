import 'package:chat_by_socket_samle/features/home/data/data_source/remote/home_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';
import '../../domain/repository/home_repository.dart';
import 'dart:async';

class HomeRepositoryImpl extends HomeRepository {
  final HomeServiceProvider homeServiceProvider;

  HomeRepositoryImpl(this.homeServiceProvider);

  @override
  Stream<DataState<CurrentUserEntity>> fetchCurrentUserData(String userId) {
    return homeServiceProvider.watchCurrentUserData(userId);
  }

  @override
  Stream<DataState<OtherUserEntity>> fetchOtherUserData(String userId) {
    return homeServiceProvider.watchOtherUserData(userId);
  }

  @override
  Future<DataState<String>> signOut(String userId) async {
    try {
      Response response = await homeServiceProvider.signOut(userId);
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

  // حذف توکن از SharedPreferences
  Future<void> removeLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('auth_token');
  }
}
