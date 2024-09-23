import 'package:chat_by_socket_samle/features/chat/data/models/custom_time_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/chat_model_entity.dart';
import '../../domain/entities/message_model_entity.dart';
import 'chat_model.dart';
import 'message_model.dart';

Timestamp toTimestamp(CustomTimeModel time) {
  return Timestamp(time.seconds, time.nanoseconds);
}

MessageModelEntity messageModelToEntity(
    MessageModel messageModel)  {
  return MessageModelEntity(
    id: messageModel.id,
    sender: messageModel.sender,
    content: messageModel.content,
    time: toTimestamp(messageModel.time) ,
    type: messageModel.type,
  );
}

ChatModelEntity chatModelToEntity(ChatModel chatModel)  {
  return ChatModelEntity(
    id: chatModel.id,
    title: chatModel.title,
    pictureUrl: chatModel.pictureUrl,
    owner: chatModel.owner,
    admins:chatModel.admins,
    members: chatModel.members,
    messages: chatModel.messages,
    isTyping: chatModel.isTypings,
    lastMessage: chatModel.lastMessage,
    type: chatModel.type,
  );
}

