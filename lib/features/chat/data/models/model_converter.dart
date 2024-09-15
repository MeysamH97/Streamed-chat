import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth_service/data/data_source/remote/auth_service_provider.dart';
import '../../../auth_service/data/models/medel_converter.dart';
import '../../../auth_service/data/models/other_user_model.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';
import '../../domain/entities/chat_model_entity.dart';
import '../../domain/entities/message_model_entity.dart';
import '../data_source/remote/chat_service_provider.dart';
import 'chat_model.dart';
import 'message_model.dart';

Future<MessageModelEntity> messageModelToEntity(
    MessageModel messageModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('auth_token') ?? '';
  return MessageModelEntity(
    id: messageModel.id,
    sender: await getSender(messageModel.senderId, token),
    content: messageModel.content,
    time: messageModel.time,
    type: messageModel.type,
  );
}

Future<ChatModelEntity> chatModelToEntity(ChatModel chatModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('auth_token') ?? '';

  return ChatModelEntity(
    id: chatModel.id,
    title: chatModel.title,
    pictureUrl: chatModel.pictureUrl,
    ownerId: chatModel.ownerId,
    admins: await getUsersData(chatModel.adminsId, token),
    members: await getUsersData(chatModel.membersId, token),
    messages: await getMessagesData(chatModel.messagesId, token),
    isTyping: await getUsersData(chatModel.isTypingsId, token),
    type: chatModel.type,
  );
}

Future<List<OtherUserEntity>> getUsersData(
    List<String> users, String token) async {
  ChatServiceProvider chatServiceProvider = ChatServiceProvider();
  List<OtherUserEntity> usersData = [];

  try {
    var responses = await Future.wait(
      users
          .map((user) => chatServiceProvider.getUserData(user, token))
          .toList(),
    );

    usersData = responses.map((response) {
      return otherUserToEntity(OtherUserModel.fromJson(response.data));
    }).toList();
  } catch (e) {
    print('Error fetching user data: $e');
  }

  return usersData;
}

Future<List<MessageModelEntity>> getMessagesData(
    List<String> messages, String token) async {
  ChatServiceProvider chatServiceProvider = ChatServiceProvider();
  List<MessageModelEntity> messagesData = [];

  try {
    var responses = await Future.wait(
      messages
          .map((message) => chatServiceProvider.getMessageData(message, token))
          .toList(),
    );

    for (var response in responses) {
      var messageData =
          await messageModelToEntity(MessageModel.fromJson(response.data));
      messagesData.add(messageData);
    }
  } catch (e) {
    print('Error fetching message data: $e');
  }

  return messagesData;
}

Future<OtherUserEntity> getSender(String senderId, String token) async {
  AuthServiceProvider authServiceProvider = AuthServiceProvider();
  var response = await authServiceProvider.getUserData(senderId, token);
  return otherUserToEntity(OtherUserModel.fromJson(response.data));
}
