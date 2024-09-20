part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}
class GetChatDataEvent extends ChatEvent {
  final String chatId;

  GetChatDataEvent(this.chatId);
}