import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/chat_model.dart';

class ChatModelEntity extends Equatable {
  final String id;
  final String title;
  final String? pictureUrl;
  final String ownerId;
  final List<String> admins;
  final List<String>? members;
  final List<String>? messages;
  final List<String>? isTyping;
  final ChatType type;

  const ChatModelEntity({
    required this.id,
    required this.title,
    this.pictureUrl,
    required this.ownerId,
    required this.admins,
    this.members,
    this.messages,
    this.isTyping,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        ownerId,
        admins,
        members,
        messages,
        isTyping,
        type,
      ];
}
