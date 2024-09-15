import 'package:chat_by_socket_samle/core/use_case/future_use_case.dart';
import 'package:chat_by_socket_samle/features/home/domain/repository/home_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/repository/auth_repository.dart';

class SignOutUseCase extends FutureUseCase<DataState<String>, String> {
  final HomeRepository homeRepository;

  SignOutUseCase(this.homeRepository);

  @override
  Future<DataState<String>> call(param) {
    return homeRepository.signOut(param);
  }
}
