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
      admins:
          (json['admins'] as List<dynamic>).map((e) => e as String).toList(),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isTypings: (json['isTypings'] as List<dynamic>?)
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
      'admins': instance.admins,
      'members': instance.members,
      'messages': instance.messages,
      'isTypings': instance.isTypings,
      'type': _$ChatTypeEnumMap[instance.type]!,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.public: 'public',
};
