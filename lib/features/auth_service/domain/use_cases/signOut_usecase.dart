import 'package:chat_by_socket_samle/core/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase extends UseCase<DataState<void>,FirebaseAuth >{

  final AuthRepository authRepository;
  SignOutUseCase(this.authRepository);

  @override
  Future <DataState<void>> call(FirebaseAuth param) {
    return authRepository.signOut(param);
  }

}