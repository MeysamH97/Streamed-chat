part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}
class GetMessageDataEvent extends MessageEvent {
  final String userId;
  final String chatId;
  final String messageId;

  GetMessageDataEvent(this.userId, this.chatId, this.messageId);
}