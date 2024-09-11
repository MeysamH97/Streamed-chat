import 'package:chat_by_socket_samle/core/use_case/use_case.dart';
import '../../../../core/resources/data_state.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase extends UseCase<DataState<String>, String> {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  @override
  Future<DataState<String>> call(param) {
    return authRepository.signOut(param);
  }
}
