// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      pictureUrl: json['pictureUrl'] as String?,
      ownerId: json['ownerId'] as String,
      adminsId:
          (json['adminsId'] as List<dynamic>).map((e) => e as String).toList(),
      membersId:
          (json['membersId'] as List<dynamic>).map((e) => e as String).toList(),
      messagesId: (json['messagesId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isTypingsId: (json['isTypingsId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'ownerId': instance.ownerId,
      'adminsId': instance.adminsId,
      'membersId': instance.membersId,
      'messagesId': instance.messagesId,
      'isTypingsId': instance.isTypingsId,
      'type': _$ChatTypeEnumMap[instance.type]!,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.public: 'public',
};
