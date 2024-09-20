// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentUserModelImpl _$$CurrentUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentUserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      chats:
          (json['chats'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$CurrentUserModelImplToJson(
        _$CurrentUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profilePictureUrl': instance.profilePictureUrl,
      'email': instance.email,
      'password': instance.password,
      'contacts': instance.contacts,
      'blockedUsers': instance.blockedUsers,
      'chats': instance.chats,
      'isOnline': instance.isOnline,
    };
