import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SendMessageStatus extends Equatable{

}
class SendMessageInitial extends SendMessageStatus {
  @override
  List<Object?> get props => [];
}

class SendMessageLoading extends SendMessageStatus {
  @override
  List<Object?> get props => [];
}

class SendMessageCompleted extends SendMessageStatus {

  final Map<String,dynamic> result;
  SendMessageCompleted(this.result);

  @override
  List<Object?> get props => [result];

}

class  SendMessageError extends  SendMessageStatus {

  final String message;
  SendMessageError(this.message);

  @override
  List<Object?> get props => [message];

}