import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_messages_data_use_case.dart';
import 'get_messages_data_status.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetMessagesDataUseCase getMessagesDataUseCase;

  MessageBloc({required this.getMessagesDataUseCase})
      : super(
    MessageState(
      getMessagesDataStatus: GetMessagesDataLoading(),
    ),
  ) {

    on<GetMessageDataEvent>((event, emit) async{

      await for (final dataState in getMessagesDataUseCase(
          {'userId' : event.userId, 'chatId' : event.chatId, 'messageId' : event.messageId}
      )) {

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newGetMessagesDataStatus:
              GetMessagesDataCompleted(dataState.data!),
            ),
          );
        } else if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newGetMessagesDataStatus:
              GetMessagesDataError(dataState.error!),
            ),
          );
        }
      }
    });
  }
}
