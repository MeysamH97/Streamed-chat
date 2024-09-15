import '../../../../core/resources/data_state.dart';
import '../entities/user_model_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserModelEntity>> fetchCurrentUserData(String userId);

  Future<DataState<UserModelEntity>> fetchUserDataWithSignIn(
      String email, String password);

  Future<DataState<UserModelEntity>> fetchUserDataWithSignUp(
      String email, String password);
}
