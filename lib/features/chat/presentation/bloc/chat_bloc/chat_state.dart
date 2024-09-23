part of 'chat_bloc.dart';

@immutable
class ChatState extends Equatable {
  final GetChatsDataStatus getChatsDataStatus;
  final SendMessageStatus sendMessageStatus;

  const ChatState( {
    required this.getChatsDataStatus,
    required this.sendMessageStatus,
  });

  ChatState copyWith({
    GetChatsDataStatus? newGetChatsDataStatus,
    SendMessageStatus? newSendMessageStatus,
  }) {
    return ChatState(
      getChatsDataStatus: newGetChatsDataStatus ?? getChatsDataStatus,
      sendMessageStatus: newSendMessageStatus ?? sendMessageStatus,
    );
  }

  @override
  List<Object?> get props => [getChatsDataStatus,sendMessageStatus];
}
