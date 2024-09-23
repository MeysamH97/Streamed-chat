
import 'package:freezed_annotation/freezed_annotation.dart';

import 'custom_time_model.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel  with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String sender,
    required String content,
    required CustomTimeModel time,
    required MessageType type,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

}

enum MessageType { text, image, video, audio, file }

