import 'package:chat_by_socket_samle/core/resources/api_service.dart';
import 'package:dio/dio.dart';

class HomeServiceProvider {
  ApiServiceProvider apiServiceProvider = ApiServiceProvider();
  SocketProvider socketProvider = SocketProvider();

  // Sign out
  Future<Response> signOut(String userId) async {
    try {
      return await apiServiceProvider.signOut(userId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }


}
