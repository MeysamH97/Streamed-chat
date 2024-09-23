import 'dart:async';
import 'package:chat_by_socket_samle/core/resources/api_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../auth_service/domain/entities/user_model_entity.dart';

class HomeServiceProvider {
  ApiServiceProvider apiServiceProvider = ApiServiceProvider();

  // Sign out
  Future<Response> signOut(String userId) async {
    try {
      return await apiServiceProvider.signOut(userId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Stream<DataState<CurrentUserEntity>> watchCurrentUserData(String userId) {
    try {
      return apiServiceProvider.watchCurrentUserData(userId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Stream<DataState<OtherUserEntity>> watchOtherUserData(String userId) {
    try {
      return apiServiceProvider.watchOtherUserData(userId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

}
