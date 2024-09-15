import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth_service/data/models/user_model.dart';
import '../../domain/entities/chat_model_entity.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel extends ChatModelEntity with _$ChatModel {
  const factory ChatModel({
    required String id,
    required String title,
    String? pictureUrl,
    required String owner,
    required List<String> admins,
    required List<String> members,
    @Default([]) List<MessageModelEntity> messages,
    @Default([]) List<UserModel> isTyping,
    required ChatType type,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  ChatModelEntity toEntity() {
    return ChatModelEntity(
      id: id,
      title: title,
      pictureUrl: pictureUrl,
      owner: owner,
      admins: admins,
      members: members,
      messages: messages,
      isTyping: isTyping,
      type: type,
    );
  }
}

enum ChatType {
  private,
  public,
}
