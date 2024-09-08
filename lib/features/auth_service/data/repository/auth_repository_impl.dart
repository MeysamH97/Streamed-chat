import 'package:chat_by_socket_samle/core/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_service_provider.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final AuthServiceProvider authServiceProvider;

  AuthRepositoryImpl(this.authServiceProvider);

  @override
  Future<DataState<UserModelEntity>> fetchCurrentUserData(FirebaseAuth auth) async {
    try {
      User? currentUser = auth.currentUser;

      if (currentUser == null) {
        return DataFailed('No user found.');
      }

      DocumentSnapshot docSnapshot = await Constants.userRef.doc(currentUser.uid).get();
      if (!docSnapshot.exists) {
        return DataFailed('User data not found.');
      }

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      UserModelEntity currentUserData = UserModel.fromJson(data).toEntity();

      return DataSuccess(currentUserData);

    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserModelEntity>> fetchUserDataWithSignIn(String email, String password) async {
    try {
      User? currentUser = await authServiceProvider.signInWithEmailAndPassword(email, password);

      if (currentUser != null) {
        DocumentSnapshot docSnapshot = await Constants.userRef.doc(currentUser.uid).get();
        if (!docSnapshot.exists) {
          return DataFailed('User data not found.');
        }

        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        UserModelEntity currentUserData = UserModel.fromJson(data).toEntity();

        return DataSuccess(currentUserData);
      } else {
        return DataFailed('User data not found.');
      }
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserModelEntity>> fetchUserDataWithSignUp(String email, String password) async {
    try {
      User? currentUser = await authServiceProvider.signUpWithEmailAndPassword(email, password);
      if (currentUser != null) {
        UserModel _newUserData = UserModel(
          id: currentUser.uid,
          username: '',
          email: currentUser.email ?? '',
          password: password,
          profilePictureUrl: '',
          contacts: [],
          blockedUsers: [],
          isOnline: true,
        );
        await Constants.userRef.doc(currentUser.uid).set(_newUserData.toJson());
        UserModelEntity newUserData = _newUserData.toEntity();

        return DataSuccess(newUserData);
      } else {
        return DataFailed('User creation failed.');
      }
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserModelEntity>> signOut(FirebaseAuth auth) async {
    try {
     await authServiceProvider.signOut(auth);
        return DataSuccess(null);
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }
}
