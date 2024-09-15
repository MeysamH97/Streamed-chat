import 'package:chat_by_socket_samle/features/auth_service/data/data_source/remote/auth_service_provider.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/auth_check_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signInWithEmailAndPassword_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signOut_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/signUp_cubit.dart';
import 'package:chat_by_socket_samle/features/home/data/data_source/remote/socket_provider.dart';
import 'package:chat_by_socket_samle/features/home/domain/use_cases/get_current_user_data_use_case.dart';
import 'package:get_it/get_it.dart';

import 'features/auth_service/data/repository/auth_repository_impl.dart';
import 'features/auth_service/domain/repository/auth_repository.dart';
import 'features/auth_service/domain/use_cases/signUpWithEmailAndPassword_usecase.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  ///Api provider:
  locator.registerSingleton<AuthServiceProvider>(AuthServiceProvider());
  locator.registerSingleton<SocketProvider>(SocketProvider());

  ///Repositories:
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));

  ///UseCases:
  locator.registerSingleton<AuthCheckUseCase>(AuthCheckUseCase(locator()));
  locator.registerSingleton<SignInWithEmailAndPasswordUseCase>(
      SignInWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignUpWithEmailAndPasswordUseCase>(
      SignUpWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignOutUseCase>(SignOutUseCase(locator()));
  locator.registerSingleton<GetCurrentUserDataUseCase>(
      GetCurrentUserDataUseCase(locator()));

  ///Blocs
  locator.registerSingleton<LoginCubit>(
    LoginCubit(),
  );
  locator.registerSingleton<SignUpCubit>(
    SignUpCubit(
    ),
  );
  locator.registerSingleton<AuthBloc>(
    AuthBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerSingleton<HomeBloc>(
    HomeBloc(locator()),
  );
}
