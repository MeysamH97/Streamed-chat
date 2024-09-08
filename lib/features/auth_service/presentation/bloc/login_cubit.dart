import 'package:bloc/bloc.dart';

enum LoginButtonState { initial, enabled, loading }

class LoginCubit extends Cubit<LoginButtonState> {
  LoginCubit() : super(LoginButtonState.initial);

  void checkFields(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(LoginButtonState.enabled); // Enable button
    } else {
      emit(LoginButtonState.initial); // Disable button
    }
  }

  void setLoading() {
    emit(LoginButtonState.loading); // Show loading
  }

  void reset() {
    emit(LoginButtonState.initial); // Reset to initial state
  }
}
