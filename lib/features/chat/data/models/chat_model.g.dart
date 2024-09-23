// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      pictureUrl: json['pictureUrl'] as String?,
      owner: json['owner'] as String,
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
      lastMessage: json['lastMessage'] as String?,
      type: $enumDecode(_$ChatTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'owner': instance.owner,
      'admins': instance.admins,
      'members': instance.members,
      'messages': instance.messages,
      'isTypings': instance.isTypings,
      'lastMessage': instance.lastMessage,
      'type': _$ChatTypeEnumMap[instance.type]!,
    };

const _$ChatTypeEnumMap = {
  ChatType.private: 'private',
  ChatType.public: 'public',
};
