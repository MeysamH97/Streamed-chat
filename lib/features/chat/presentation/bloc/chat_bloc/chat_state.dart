part of 'chat_bloc.dart';

@immutable
class ChatState extends Equatable {
  final GetChatsDataStatus getChatsDataStatus;

  const ChatState({
    required this.getChatsDataStatus,
  });

  ChatState copyWith({
    GetChatsDataStatus? newGetChatsDataStatus,
  }) {
    return ChatState(
      getChatsDataStatus: newGetChatsDataStatus ?? getChatsDataStatus,
    );
  }

  @override
  List<Object?> get props => [getChatsDataStatus];
}
