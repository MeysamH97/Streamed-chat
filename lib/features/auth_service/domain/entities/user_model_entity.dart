import 'package:equatable/equatable.dart';

// کلاس والد شامل اطلاعات پایه کاربر
abstract class UserModelEntity extends Equatable {
  final String id;
  final String email;
  final String? username;
  final String? profilePictureUrl;
  final bool isOnline;

  const UserModelEntity({
    required this.id,
    required this.email,
    this.username,
    this.profilePictureUrl,
    required this.isOnline,
  });

  List<Object?> get props => [id, email, username, profilePictureUrl, isOnline];
}

// کلاس شامل اطلاعات پایه برای نمایش مخاطبین یا کاربران دیگر
class OtherUserEntity extends UserModelEntity {
  const OtherUserEntity({
    required super.id,
    required super.email,
    super.username,
    super.profilePictureUrl,
    required super.isOnline,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    profilePictureUrl,
    isOnline
  ];
}

// کلاس شامل اطلاعات کامل برای کاربر جاری
class CurrentUserEntity extends UserModelEntity {
  final String password;
  final List<String>? contacts;
  final List<String>? blockedUsers;
  final List<String>? chats;

  const CurrentUserEntity({
    required super.id,
    required super.email,
    super.username,
    super.profilePictureUrl,
    required super.isOnline,
    required this.password,
    this.contacts = const [],
    this.blockedUsers = const [],
    this.chats = const [],
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
        profilePictureUrl,
        contacts,
        blockedUsers,
        chats,
        isOnline
      ];
}
