import 'package:chat_by_socket_samle/core/use_case/stream_use_case.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/home/domain/repository/home_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetContactsDataUseCase extends StreamUseCase<DataState<OtherUserEntity>,String >{
  final HomeRepository homeRepository;

  GetContactsDataUseCase(this.homeRepository);

  @override
  Stream <DataState<OtherUserEntity>> call(param) {
    return homeRepository.fetchOtherUserData(param);
  }

}