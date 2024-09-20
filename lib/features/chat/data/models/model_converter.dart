
import '../../domain/entities/chat_model_entity.dart';
import '../../domain/entities/message_model_entity.dart';
import 'chat_model.dart';
import 'message_model.dart';

MessageModelEntity messageModelToEntity(
    MessageModel messageModel)  {
  return MessageModelEntity(
    id: messageModel.id,
    sender: messageModel.sender,
    content: messageModel.content,
    time: messageModel.time,
    type: messageModel.type,
  );
}

ChatModelEntity chatModelToEntity(ChatModel chatModel)  {
  return ChatModelEntity(
    id: chatModel.id,
    title: chatModel.title,
    pictureUrl: chatModel.pictureUrl,
    ownerId: chatModel.ownerId,
    admins:chatModel.admins,
    members: chatModel.members,
    messages: chatModel.messages,
    isTyping: chatModel.isTypings,
    type: chatModel.type,
  );
}

