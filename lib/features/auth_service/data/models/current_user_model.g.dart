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
      contactsId: (json['contactsId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedUsersId: (json['blockedUsersId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      chatsId: (json['chatsId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
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
      'contactsId': instance.contactsId,
      'blockedUsersId': instance.blockedUsersId,
      'chatsId': instance.chatsId,
      'isOnline': instance.isOnline,
    };
