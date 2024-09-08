
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;


  //sign in
  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //sign up
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //sign out
  Future<void> signOut(FirebaseAuth auth) async {
    try {
      return auth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
