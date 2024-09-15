import 'package:chat_by_socket_samle/core/use_case/future_use_case.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/user_model_entity.dart';
import '../repository/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase extends FutureUseCase<DataState<UserModelEntity>,Map<String,dynamic> >{

  final AuthRepository authRepository;
  SignUpWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future <DataState<UserModelEntity>> call(param) {
    print('Start fetching current user data');
    return authRepository.fetchUserDataWithSignUp(param['email'], param['password']);
  }

}