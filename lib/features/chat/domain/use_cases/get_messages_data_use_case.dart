import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/stream_use_case.dart';
import '../entities/message_model_entity.dart';
import '../repository/chat_repository.dart';

class GetMessagesDataUseCase extends StreamUseCase<DataState<MessageModelEntity>,Map >{
  final ChatRepository chatRepository;

  GetMessagesDataUseCase(this.chatRepository);

  @override
  Stream <DataState<MessageModelEntity>> call(param) {
    return chatRepository.fetchMessageData(param['userId'], param['chatId'], param['messageId']);
  }

}