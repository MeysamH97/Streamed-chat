part of 'message_bloc.dart';

@immutable
class MessageState extends Equatable {
  final GetMessagesDataStatus getMessagesDataStatus;

  const MessageState({
    required this.getMessagesDataStatus,
  });

  MessageState copyWith({
    GetMessagesDataStatus? newGetMessagesDataStatus,
  }) {
    return MessageState(
      getMessagesDataStatus: newGetMessagesDataStatus ?? getMessagesDataStatus,
    );
  }

  @override
  List<Object?> get props => [getMessagesDataStatus];
}
