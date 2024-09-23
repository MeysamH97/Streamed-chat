
import 'package:bloc/bloc.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/domain/use_cases/send_messages_use_case.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/bloc/chat_bloc/send_message_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_chats_data_use_case.dart';
import 'get_chats_data_status.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsDataUseCase getChatsDataUseCase;
  final SendMessagesUseCase sendMessagesUseCase;

  ChatBloc( {required this.sendMessagesUseCase,required this.getChatsDataUseCase})
      : super(
    ChatState(
      getChatsDataStatus: GetChatsDataLoading(),
      sendMessageStatus: SendMessageInitial(),

    ),
  ) {

    on<GetChatDataEvent>((event, emit) async{
      await for (final dataState in getChatsDataUseCase(
        {'userId' : event.userId, 'chatId' : event.chatId}
      )) {

        print(dataState.data);
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

    on<SendMessageEvent>((event, emit) async{
      emit(
        state.copyWith(
          newSendMessageStatus:
          SendMessageLoading(),
        ),
      );
      DataState dataState = await sendMessagesUseCase(
        {'userId' : event.userId, 'chatId' : event.chatId, 'message' : event.newMessage});

      print(dataState.error.toString());

        if (dataState is DataSuccess) {
          print('success in sending');
          emit(
            state.copyWith(
              newSendMessageStatus:
              SendMessageCompleted(dataState.data),
            ),
          );
        } else if (dataState is DataFailed) {
          print('Error in sending');
          emit(
            state.copyWith(
              newGetChatsDataStatus:
              GetChatsDataError(dataState.error!),
            ),
          );
        }
    });
  }
}
