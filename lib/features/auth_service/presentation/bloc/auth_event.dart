part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthCheckEvent extends AuthEvent {
  final FirebaseAuth auth;

  AuthCheckEvent(this.auth);
}

class AuthenticationWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  AuthenticationWithEmailAndPasswordEvent(this.email, this.password);
}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent(this.email, this.password);
}

class SignOutEvent extends AuthEvent {
  final FirebaseAuth auth;

  SignOutEvent(this.auth);
}
