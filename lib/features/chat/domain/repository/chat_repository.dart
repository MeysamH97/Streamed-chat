import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class ChatRepository {

  Stream<DataState<ChatModelEntity>> fetchChatData (String userId, String chatId);

  Stream<DataState<ChatModelEntity>> createNewPrivateChat (String userId, String otherUserId);

  Stream<DataState<ChatModelEntity>> createNewPublicChat (String userId, String chatId);

  Stream<DataState<MessageModelEntity>> fetchMessageData (String userId, String chatId, String messageId);

  Future<DataState<Map<String, dynamic>>> sendMessage (String userId, String chatId, MessageModelEntity message);

}