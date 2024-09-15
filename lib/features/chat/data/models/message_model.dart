import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/timestamp_converter.dart';
import '../../domain/entities/message_model_entity.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel  with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String senderId,
    required String content,
    @TimestampConverter() required Timestamp time,
    required MessageType type,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

enum MessageType { text, image, video, audio, file }



