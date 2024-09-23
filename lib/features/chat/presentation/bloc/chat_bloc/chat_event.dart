part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}
class GetChatDataEvent extends ChatEvent {
  final String userId;
  final String chatId;

  GetChatDataEvent(this.userId, this.chatId);
}

class SendMessageEvent extends ChatEvent {
  final String userId;
  final String chatId;
  final MessageModelEntity newMessage;

  SendMessageEvent({required this.newMessage, required this.userId, required this.chatId});
}
