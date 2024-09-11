import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_entity.dart';

abstract class HomeRepository {

  Future<DataState<UserModelEntity>> fetchCurrentUserData (String userId);


}