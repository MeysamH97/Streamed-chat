import 'package:chat_by_socket_samle/core/resources/api_service.dart';
import 'package:dio/dio.dart';

class ChatServiceProvider {
  ApiServiceProvider apiServiceProvider = ApiServiceProvider();

  Future<Response> getUserData(String userId, String token) async {
    try {
      return await apiServiceProvider.getUserData(userId, token);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Future<Response> getMessageData(String messageId, String token) async {
    try {
      return await apiServiceProvider.getMessageData(messageId, token);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}