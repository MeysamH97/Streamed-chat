import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    String? title,
    String? pictureUrl,
    required String owner,
    required List<String> admins,
    required List<String> members,
    @Default([]) List<String> messages,
    @Default([]) List<String> isTypings,
    String? lastMessage,
    required ChatType type,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

}

enum ChatType {
  private,
  public,
}
