
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_model.freezed.dart';

part 'current_user_model.g.dart';

@freezed
class CurrentUserModel with _$CurrentUserModel {
  const factory CurrentUserModel({
    required String id,
    String? username,
    String? profilePictureUrl,
    required String email,
    required String password,
    @Default([]) List<String> contactsId,
    @Default([]) List<String> blockedUsersId,
    @Default([]) List<String> chatsId,
    required bool isOnline,
  }) = _CurrentUserModel;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserModelFromJson(json);
}
