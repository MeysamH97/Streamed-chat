import 'package:chat_by_socket_samle/features/chat/data/models/chat_model.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/message_model_entity.dart';
import '../../domain/repository/chat_repository.dart';
import 'dart:async';

import '../data_source/remote/chat_service_provider.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatServiceProvider chatServiceProvider;

  ChatRepositoryImpl(this.chatServiceProvider);

  @override
  Stream<DataState<ChatModelEntity>> createNewPrivateChat(String userId, String otherUserId) {

    List<String> admins = [userId, otherUserId]..sort(); // مرتب‌سازی id کاربران
    String chatId = admins.join('_');
    ChatModelEntity newChat = ChatModelEntity(
      id: chatId,
      owner: userId,
      admins: admins,
      members: admins,
      type: ChatType.private,
    );
    return chatServiceProvider.creatNewChat(userId, newChat);
  }

  @override
  Stream<DataState<ChatModelEntity>> createNewPublicChat(String userId, String chatId) {
    return chatServiceProvider.watchChatData(userId, chatId);
  }

  @override
  Stream<DataState<ChatModelEntity>> fetchChatData(String userId, String chatId) {
    return chatServiceProvider.watchChatData(userId, chatId);
  }

  @override
  Stream<DataState<MessageModelEntity>> fetchMessageData (String userId, String chatId, String messageId){
    return chatServiceProvider.watchMessageData(userId, chatId, messageId);
  }

  @override
  Future<DataState<Map<String, dynamic>>> sendMessage (String userId, String chatId, MessageModelEntity message){

    print(userId);
    print(chatId);
    print(message.toString());
    return chatServiceProvider.sendMessage(userId, chatId, message);
  }
}
