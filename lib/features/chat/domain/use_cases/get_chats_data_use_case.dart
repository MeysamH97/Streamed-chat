import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/stream_use_case.dart';
import '../repository/chat_repository.dart';

class GetChatsDataUseCase extends StreamUseCase<DataState<ChatModelEntity>,String >{
  final ChatRepository chatRepository;

  GetChatsDataUseCase(this.chatRepository);

  @override
  Stream <DataState<ChatModelEntity>> call(param) {
    return chatRepository.fetchChatData(param);
  }

}