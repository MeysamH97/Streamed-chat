import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';

abstract class ChatRepository {

  Stream<DataState<ChatModelEntity>> fetchChatData (String chatId);

}