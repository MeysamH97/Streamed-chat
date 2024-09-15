
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../chat/data/models/chat_model.dart';
import '../data_source/remote/auth_service_provider.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel extends UserModelEntity with _$UserModel {
  const factory UserModel({
    required String id,
    String? username,
    required String email,
    required String password,
    String? profilePictureUrl,
    @Default([]) List<String> contacts,
    @Default([]) List<String> blockedUsers,
    @Default([]) List<String> chats,
    @Default(true) bool isOnline,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Future<UserModelEntity> toEntity() async {
    return UserModelEntity(
      id: id,
      username: username,
      email: email,
      password: password,
      profilePictureUrl: profilePictureUrl,
      contacts: await getUsersData(contacts),
      blockedUsers: await getUsersData(blockedUsers),
      chats: await getChatsData(chats),
      isOnline: isOnline,
    );
  }

  Future<List<UserModel>> getUsersData (List<String> users) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthServiceProvider authServiceProvider = AuthServiceProvider();
    var token = prefs.getString('auth_token');
    List<UserModel> usersData = [];
    for(var user in users){
      var response = await authServiceProvider.getUserData(user, token ?? '');
      UserModel userData = UserModel.fromJson(response.data);
      usersData.add(userData);
    }
    return usersData;
  }

  Future<List<ChatModel>> getChatsData (List<String> chats) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthServiceProvider authServiceProvider = AuthServiceProvider();
    var token = prefs.getString('auth_token');
    List<ChatModel> chatsData = [];
    for(var chat in chats){
      var response = await authServiceProvider.getUserData(chat, token ?? '');
      ChatModel chatData = ChatModel.fromJson(response.data);
      chatsData.add(chatData);
    }
    return chatsData;
  }
}
