import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/chat_model.dart';

class ChatModelEntity extends Equatable {
  final String id;
  final String title;
  final String? pictureUrl;
  final String owner;
  final List<String> admins;
  final List<UserModelEntity> members;
  final List<MessageModelEntity>? messages;
  final List<UserModelEntity>? isTyping;
  final ChatType type;

  const ChatModelEntity({
    required this.id,
    required this.title,
    this.pictureUrl,
    required this.owner,
    required this.admins,
    required this.members,
    this.messages,
    this.isTyping,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        owner,
        admins,
        members,
        messages,
        isTyping,
        type,
      ];
}
