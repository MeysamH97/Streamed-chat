// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherUserModelImpl _$$OtherUserModelImplFromJson(Map<String, dynamic> json) =>
    _$OtherUserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$OtherUserModelImplToJson(
        _$OtherUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profilePictureUrl': instance.profilePictureUrl,
      'isOnline': instance.isOnline,
    };
