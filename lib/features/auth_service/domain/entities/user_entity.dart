import 'package:equatable/equatable.dart';

class UserModelEntity extends Equatable {
  final String id;
  final String? username;
  final String email;
  final String password;
  final String? profilePictureUrl;
  final List<String> contacts;
  final List<String> blockedUsers;
  final bool isOnline;

  const UserModelEntity({
    required this.id,
    this.username,
    required this.email,
    required this.password,
    this.profilePictureUrl,
    this.contacts = const [],
    this.blockedUsers = const [],
    this.isOnline = true,
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
        isOnline
      ];
}
