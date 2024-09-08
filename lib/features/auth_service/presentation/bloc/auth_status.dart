import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/user_entity.dart';

@immutable
abstract class AuthStatus extends Equatable{

}


class AuthLoading extends AuthStatus {
  @override
  List<Object?> get props => [];

}

class AuthCompleted extends AuthStatus {

  final UserModelEntity userModelEntity;
  AuthCompleted(this.userModelEntity);

  @override
  List<Object?> get props => [userModelEntity];

}

class AuthError extends AuthStatus {

  final String message;
  AuthError(this.message);

  @override
  List<Object?> get props => [message];

}