import '../../../../core/resources/data_state.dart';
import '../entities/user_model_entity.dart';

abstract class AuthRepository {
  Stream<DataState<CurrentUserEntity>> fetchCurrentUserData(String userId);
  //
  Future<DataState<CurrentUserEntity>> fetchUserDataWithSignIn(
      String email, String password);

  Future<DataState<CurrentUserEntity>> fetchUserDataWithSignUp(
      String email, String password);
}
