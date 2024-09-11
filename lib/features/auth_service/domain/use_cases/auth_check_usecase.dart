import 'package:chat_by_socket_samle/core/use_case/use_case.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/data_state.dart';

class AuthCheckUseCase extends UseCase<DataState<UserModelEntity>,String >{
  final AuthRepository authRepository;

  AuthCheckUseCase(this.authRepository);

  @override
  Future <DataState<UserModelEntity>> call(param) {
    return authRepository.fetchCurrentUserData(param);
  }

}