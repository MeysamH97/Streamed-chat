import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required String title,
    String? pictureUrl,
    required String ownerId,
    required List<String> adminsId,
    required List<String> membersId,
    @Default([]) List<String> messagesId,
    @Default([]) List<String> isTypingsId,
    required ChatType type,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

enum ChatType {
  private,
  public,
}
