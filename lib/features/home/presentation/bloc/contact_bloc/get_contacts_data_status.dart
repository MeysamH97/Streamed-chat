import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../auth_service/domain/entities/user_model_entity.dart';

@immutable
abstract class GetContactsDataStatus extends Equatable{

}


class GetContactsDataLoading extends GetContactsDataStatus {
  @override
  List<Object?> get props => [];
}

class GetContactsDataCompleted extends GetContactsDataStatus {

  final OtherUserEntity contact;
  GetContactsDataCompleted(this.contact);

  @override
  List<Object?> get props => [contact];

}

class  GetContactsDataError extends  GetContactsDataStatus {

  final String message;
  GetContactsDataError(this.message);

  @override
  List<Object?> get props => [message];

}