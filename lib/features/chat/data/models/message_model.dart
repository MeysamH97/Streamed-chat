import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth_service/data/data_source/remote/auth_service_provider.dart';
import '../../../auth_service/data/models/user_model.dart';
import '../../domain/entities/message_model_entity.dart';

part 'message_model.freezed.dart';

part 'message_model.g.dart';

@freezed
class MessageModel extends MessageModelEntity with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String senderId,
    required String content,
    required Timestamp time,
    required MessageType type,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Future<MessageModelEntity> toEntity() async {
    return  MessageModelEntity(
      id: id,
      sender: await getSender(senderId),
      content: content,
      time: time,
      type: type,
    );
  }

  Future<UserModel> getSender (String id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthServiceProvider authServiceProvider = AuthServiceProvider();
    var token = prefs.getString('auth_token');
    var response = await authServiceProvider.getUserData(id, token ?? '');
    UserModel userData =
    UserModel.fromJson(response.data);
    return userData;
  }
}
enum MessageType { text, image, video, audio, file }

