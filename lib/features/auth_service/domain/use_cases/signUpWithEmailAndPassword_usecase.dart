import 'package:chat_by_socket_samle/core/use_case/use_case.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase extends UseCase<DataState<UserModelEntity>,Map >{

  final AuthRepository authRepository;
  SignUpWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future <DataState<UserModelEntity>> call(param) {
    return authRepository.fetchUserDataWithSignUp(param['email'], param['password']);
  }

}