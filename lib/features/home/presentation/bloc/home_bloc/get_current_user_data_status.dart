import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../auth_service/domain/entities/user_model_entity.dart';

@immutable
abstract class GetCurrentUserDataStatus extends Equatable{

}


class GetCurrentUserDataLoading extends GetCurrentUserDataStatus {
  @override
  List<Object?> get props => [];
}

class GetCurrentUserDataCompleted extends GetCurrentUserDataStatus {

  final CurrentUserEntity currentUserEntity;
  GetCurrentUserDataCompleted(this.currentUserEntity);

  @override
  List<Object?> get props => [currentUserEntity];

}

class  GetCurrentUserDataError extends  GetCurrentUserDataStatus {

  final String message;
  GetCurrentUserDataError(this.message);

  @override
  List<Object?> get props => [message];

}