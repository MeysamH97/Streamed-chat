import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class GetChatsDataStatus extends Equatable{

}


class GetChatsDataLoading extends GetChatsDataStatus {
  @override
  List<Object?> get props => [];
}

class GetChatsDataCompleted extends GetChatsDataStatus {

  final ChatModelEntity chat;
  GetChatsDataCompleted(this.chat);

  @override
  List<Object?> get props => [chat];

}

class  GetChatsDataError extends  GetChatsDataStatus {

  final String message;
  GetChatsDataError(this.message);

  @override
  List<Object?> get props => [message];

}