import 'package:chat_by_socket_samle/core/use_case/future_use_case.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/user_model_entity.dart';
import '../repository/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase extends FutureUseCase<DataState<UserModelEntity>,Map<String,dynamic> >{

  final AuthRepository authRepository;
  SignInWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future <DataState<UserModelEntity>> call(param) {
    return authRepository.fetchUserDataWithSignIn(param['email'], param['password']);
  }
}