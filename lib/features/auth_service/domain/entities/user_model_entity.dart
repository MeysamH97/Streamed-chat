import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserModelEntity extends Equatable {
  final String id;
  final String? username;
  final String email;
  final String password;
  final String? profilePictureUrl;
  final List<UserModel>? contacts;
  final List<UserModel>? blockedUsers;
  final List<ChatModelEntity>? chats;
  final bool isOnline;

  const UserModelEntity({
    required this.id,
    this.username,
    required this.email,
    required this.password,
    this.profilePictureUrl,
    this.contacts = const [],
    this.blockedUsers = const [],
    this.chats = const [],
    this.isOnline = true,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
        profilePictureUrl,
        contacts,
        blockedUsers,
        isOnline
      ];
}
