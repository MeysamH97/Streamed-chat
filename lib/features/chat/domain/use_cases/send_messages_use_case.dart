import 'package:chat_by_socket_samle/core/use_case/future_use_case.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/chat_repository.dart';

class SendMessagesUseCase extends FutureUseCase<DataState<Map<String, dynamic>>,Map >{
  final ChatRepository chatRepository;

  SendMessagesUseCase(this.chatRepository);

  @override
  Future<DataState<Map<String, dynamic>>> call(param) {
    return chatRepository.sendMessage(param['userId'], param['chatId'], param['message']);
  }

}