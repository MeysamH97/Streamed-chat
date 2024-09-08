
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {

  Future<DataState<UserModelEntity>> fetchCurrentUserData (FirebaseAuth auth);
  Future<DataState<UserModelEntity>> fetchUserDataWithSignIn (String email, String password);
  Future<DataState<UserModelEntity>> fetchUserDataWithSignUp (String email, String password);
  Future<DataState<void>> signOut (FirebaseAuth auth);


}