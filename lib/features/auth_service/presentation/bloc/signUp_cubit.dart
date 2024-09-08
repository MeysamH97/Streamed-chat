import 'package:bloc/bloc.dart';

enum SignUpButtonState { initial, enabled, loading }

class SignUpCubit extends Cubit<SignUpButtonState> {
  SignUpCubit() : super(SignUpButtonState.initial);

  void checkFields(String email, String password, String verifyPassword) {
    if (email.isNotEmpty && password.isNotEmpty && (verifyPassword == password)) {
      emit(SignUpButtonState.enabled);  // Enable button
    } else {
      emit(SignUpButtonState.initial);  // Disable button
    }
  }
  void setLoading() {
    emit(SignUpButtonState.loading); // Show loading
  }

  void reset() {
    emit(SignUpButtonState.initial); // Reset to initial state
  }
}
