import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/message_model_entity.dart';

@immutable
abstract class GetMessagesDataStatus extends Equatable {}

class GetMessagesDataLoading extends GetMessagesDataStatus {
  @override
  List<Object?> get props => [];
}

class GetMessagesDataCompleted extends GetMessagesDataStatus {
  final MessageModelEntity message;

  GetMessagesDataCompleted(this.message);

  @override
  List<Object?> get props => [message];
}

class GetMessagesDataError extends GetMessagesDataStatus {
  final String message;

  GetMessagesDataError(this.message);

  @override
  List<Object?> get props => [message];
}
