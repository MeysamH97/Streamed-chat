import 'package:bloc/bloc.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/auth_check_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signInWithEmailAndPassword_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/signOut_usecase.dart';
import '../../domain/use_cases/signUpWithEmailAndPassword_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthCheckUseCase authCheckUseCase;
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc(this.authCheckUseCase, this.signInWithEmailAndPasswordUseCase,
      this.signUpWithEmailAndPasswordUseCase, this.signOutUseCase)
      : super(
          AuthState(
            authStatus: AuthLoading(),
          ),
        ) {
    on<AuthCheckEvent>(
      (event, emit) async {
        if (event.userId == null || event.userId == '') {
          emit(
              state.copyWith(newAuthStatus: AuthError('No User had Loged in')));
        } else {
          DataState dataState = await authCheckUseCase(event.userId!);

          if (dataState is DataSuccess) {
            emit(state.copyWith(newAuthStatus: AuthCompleted(dataState.data)));
          }

          if (dataState is DataFailed) {
            emit(state.copyWith(newAuthStatus: AuthError(dataState.error!)));
          }
        }
      },
    );

    on<AuthenticationWithEmailAndPasswordEvent>((event, emit) async {
      // emit(
      //   state.copyWith(
      //     newAuthStatus: AuthError('Please Login or SignUp'),
      //   ),
      // );

      DataState dataState = await signInWithEmailAndPasswordUseCase(
          {'email': event.email, 'password': event.password});

      if (dataState is DataSuccess) {
        emit(state.copyWith(newAuthStatus: AuthCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newAuthStatus: AuthError(dataState.error!)));
      }
    });

    on<SignUpWithEmailAndPasswordEvent>((event, emit) async {
      print('Start sign up event');
      DataState dataState = await signUpWithEmailAndPasswordUseCase(
          {'email': event.email, 'password': event.password});
      print('user data prepared');

      if (dataState is DataSuccess) {
        emit(state.copyWith(newAuthStatus: AuthCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newAuthStatus: AuthError(dataState.error!)));
      }
    });

    on<SignOutEvent>((event, emit) async {

      DataState dataState = await signOutUseCase(event.userId);

      if (dataState is DataSuccess) {
        emit(state.copyWith(newAuthStatus: AuthError('Log Out Successfully')));
      }
    });
  }
}
