import 'package:shared_preferences/shared_preferences.dart';
import '../../../chat/data/models/chat_model.dart';
import '../../../chat/data/models/model_converter.dart';
import '../../../chat/domain/entities/chat_model_entity.dart';
import '../../domain/entities/user_model_entity.dart';
import '../data_source/remote/auth_service_provider.dart';
import 'current_user_model.dart';
import 'other_user_model.dart';



Future<CurrentUserEntity> currentUserToEntity(CurrentUserModel currentUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('auth_token') ?? '';

  return CurrentUserEntity(
    id: currentUser.id,
    email: currentUser.email,
    username: currentUser.username,
    profilePictureUrl: currentUser.profilePictureUrl,
    isOnline: currentUser.isOnline,
    password: currentUser.password,
    contacts: await getUsersData(currentUser.contactsId, token),
    blockedUsers: await getUsersData(currentUser.blockedUsersId, token),
    chats: await getChatsData(currentUser.chatsId, token),
  );
}

OtherUserEntity otherUserToEntity(OtherUserModel otherUser) {
  return OtherUserEntity(
    id: otherUser.id,
    email: otherUser.email,
    username: otherUser.username,
    profilePictureUrl: otherUser.profilePictureUrl,
    isOnline: otherUser.isOnline,
  );
}

Future<List<OtherUserEntity>> getUsersData(List<String> users, String token) async {
  AuthServiceProvider chatServiceProvider = AuthServiceProvider();
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

Future<List<ChatModelEntity>> getChatsData(List<String> chatsId, String token) async {
  AuthServiceProvider authServiceProvider = AuthServiceProvider();
  List<ChatModelEntity> chatsData = [];
  try {
    var responses = await Future.wait(
      chatsId
          .map((chat) => authServiceProvider.getChatData(chat, token))
          .toList(),
    );

    for (var response in responses) {
      var chatData = await chatModelToEntity(ChatModel.fromJson(response.data));
      chatsData.add(chatData);
    }
  } catch (e) {
    // مدیریت خطا
    print('Error fetching chat data: $e');
  }
  return chatsData;
}
