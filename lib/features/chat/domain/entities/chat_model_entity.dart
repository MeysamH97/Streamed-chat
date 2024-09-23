
import 'package:equatable/equatable.dart';

import '../../data/models/chat_model.dart';

class ChatModelEntity extends Equatable {
  final String id;
  final String? title;
  final String? pictureUrl;
  final String owner;
  final List<String> admins;
  final List<String>? members;
  final List<String>? messages;
  final List<String>? isTyping;
  final String? lastMessage;
  final ChatType type;

  const ChatModelEntity({
    required this.id,
    this.title,
    this.pictureUrl,
    required this.owner,
    required this.admins,
    this.members,
    this.messages,
    this.isTyping,
    this.lastMessage,
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
