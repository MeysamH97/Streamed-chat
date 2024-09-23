
import 'package:chat_by_socket_samle/core/use_case/stream_use_case.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/repository/auth_repository.dart';

import '../../../../core/resources/data_state.dart';

class AuthCheckUseCase extends StreamUseCase<DataState<CurrentUserEntity>,String >{
  final AuthRepository authRepository;

  AuthCheckUseCase(this.authRepository);

  @override
  Stream <DataState<CurrentUserEntity>> call(param) {
    return authRepository.fetchCurrentUserData(param);
  }

}