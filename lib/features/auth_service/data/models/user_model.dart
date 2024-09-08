import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends UserModelEntity with _$UserModel {
  const factory UserModel({
    required String id,
    String? username,
    required String email,
    required String password,
    String? profilePictureUrl,
    @Default([]) List<String> contacts,
    @Default([]) List<String> blockedUsers,
    @Default(true) bool isOnline,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserModelEntity toEntity() {
    return UserModelEntity(
      id: id,
      username: username,
      email: email,
      password: password,
      profilePictureUrl: profilePictureUrl,
      contacts: contacts,
      blockedUsers: blockedUsers,
      isOnline: isOnline,
    );
  }
}
