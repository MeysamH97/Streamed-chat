
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_user_model.freezed.dart';

part 'other_user_model.g.dart';

@freezed
class OtherUserModel  with _$OtherUserModel {
  const factory OtherUserModel({
    required String id,
    required String email,
    String? username,
    String? profilePictureUrl,
    required bool isOnline,
  }) = _OtherUserModel;

  factory OtherUserModel.fromJson(Map<String, dynamic> json) =>
      _$OtherUserModelFromJson(json);
}

