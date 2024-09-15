// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      time: const TimestampConverter().fromJson(json['time'] as Object),
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'content': instance.content,
      'time': const TimestampConverter().toJson(instance.time),
      'type': _$MessageTypeEnumMap[instance.type]!,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
};
