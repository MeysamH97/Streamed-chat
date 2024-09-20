import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';

abstract class HomeRepository {

  Stream<DataState<CurrentUserEntity>> fetchCurrentUserData (String userId);

  Stream<DataState<OtherUserEntity>> fetchOtherUserData (String userId);

  Future<DataState<String>> signOut(String userId);

}