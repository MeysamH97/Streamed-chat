import 'package:chat_by_socket_samle/features/auth_service/data/data_source/remote/auth_service_provider.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/auth_check_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signInWithEmailAndPassword_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signOut_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/signUp_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth_service/data/repository/auth_repository_impl.dart';
import 'features/auth_service/domain/repository/auth_repository.dart';
import 'features/auth_service/domain/use_cases/signUpWithEmailAndPassword_usecase.dart';

GetIt locator = GetIt.instance;

setup() async {

  ///Api provider:
  locator.registerSingleton<AuthServiceProvider>(AuthServiceProvider());

  ///Repositories:
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  ///UseCases:
  locator.registerSingleton<AuthCheckUseCase>(AuthCheckUseCase(locator()));
  locator.registerSingleton<SignInWithEmailAndPasswordUseCase>(
      SignInWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignUpWithEmailAndPasswordUseCase>(
      SignUpWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignOutUseCase>(
      SignOutUseCase(locator()));

  ///Blocs
  locator.registerSingleton<AuthBloc>(
    AuthBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
