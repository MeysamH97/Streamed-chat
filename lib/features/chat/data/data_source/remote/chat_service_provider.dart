import 'package:chat_by_socket_samle/core/resources/api_service.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:dio/dio.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/chat_model_entity.dart';

class ChatServiceProvider {
  ApiServiceProvider apiServiceProvider = ApiServiceProvider();
  SocketProvider socketProvider = SocketProvider();

  Stream <DataState<ChatModelEntity>> creatNewChat(String userId, ChatModelEntity newChat)  {
    try {
      return   apiServiceProvider.createNewChat( userId, newChat);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Stream <DataState<ChatModelEntity>> watchChatData(String userId, String chatId)  {
    try {
      return   apiServiceProvider.watchChatData( userId, chatId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Future<DataState<Map<String, dynamic>>> sendMessage (String userId, String chatId, MessageModelEntity message){
    try {
      return  apiServiceProvider.sendMessage( userId, chatId, message);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  Stream <DataState<MessageModelEntity>> watchMessageData(String userId, String chatId, String messageId)  {
    try {
      return  apiServiceProvider.watchMessageData( userId, chatId, messageId);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }
}