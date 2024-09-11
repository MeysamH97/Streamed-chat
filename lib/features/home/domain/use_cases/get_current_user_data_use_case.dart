import 'package:chat_by_socket_samle/core/use_case/use_case.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';
import 'package:chat_by_socket_samle/features/home/domain/repository/home_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetCurrentUserDataUseCase extends UseCase<DataState<UserModelEntity>,String >{
  final HomeRepository homeRepository;

  GetCurrentUserDataUseCase(this.homeRepository);

  @override
  Future <DataState<UserModelEntity>> call(param) {
    return homeRepository.fetchCurrentUserData(param);
  }

}