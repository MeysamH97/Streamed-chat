
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_chats_data_use_case.dart';
import 'get_chats_data_status.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsDataUseCase getChatsDataUseCase;

  ChatBloc({required this.getChatsDataUseCase})
      : super(
    ChatState(
      getChatsDataStatus: GetChatsDataLoading(),
    ),
  ) {

    on<GetChatDataEvent>((event, emit) async{

      await for (final dataState in getChatsDataUseCase(event.chatId)) {

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newGetChatsDataStatus:
              GetChatsDataCompleted(dataState.data!),
            ),
          );
        } else if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newGetChatsDataStatus:
              GetChatsDataError(dataState.error!),
            ),
          );
        }
      }
    });
  }
}
