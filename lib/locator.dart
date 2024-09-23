import 'package:chat_by_socket_samle/features/auth_service/data/data_source/remote/auth_service_provider.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/auth_check_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/use_cases/signInWithEmailAndPassword_usecase.dart';
import 'package:chat_by_socket_samle/features/chat/data/data_source/remote/chat_service_provider.dart';
import 'package:chat_by_socket_samle/features/chat/domain/use_cases/get_chats_data_use_case.dart';
import 'package:chat_by_socket_samle/features/chat/domain/use_cases/get_messages_data_use_case.dart';
import 'package:chat_by_socket_samle/features/chat/domain/use_cases/send_messages_use_case.dart';
import 'package:chat_by_socket_samle/features/home/data/data_source/remote/home_service_provider.dart';
import 'package:chat_by_socket_samle/features/home/domain/use_cases/get_contacts_data_use_case.dart';
import 'package:chat_by_socket_samle/features/home/domain/use_cases/signOut_usecase.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/signUp_cubit.dart';
import 'package:chat_by_socket_samle/features/home/domain/use_cases/get_current_user_data_use_case.dart';
import 'package:chat_by_socket_samle/features/home/presentation/bloc/contact_bloc/contact_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/resources/api_service.dart';
import 'features/auth_service/data/repository/auth_repository_impl.dart';
import 'features/auth_service/domain/repository/auth_repository.dart';
import 'features/auth_service/domain/use_cases/signUpWithEmailAndPassword_usecase.dart';
import 'features/chat/data/repository/chat_repository_impl.dart';
import 'features/chat/domain/repository/chat_repository.dart';
import 'features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/presentation/bloc/home_bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  ///Api provider:
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerSingleton<ApiServiceProvider>(ApiServiceProvider());
  locator.registerSingleton<SocketProvider>(SocketProvider());
  locator.registerSingleton<AuthServiceProvider>(AuthServiceProvider());
  locator.registerSingleton<HomeServiceProvider>(HomeServiceProvider());
  locator.registerSingleton<ChatServiceProvider>(ChatServiceProvider());

  ///Repositories:
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<ChatRepository>(ChatRepositoryImpl(locator()));

  ///UseCases:
  locator.registerSingleton<AuthCheckUseCase>(AuthCheckUseCase(locator()));
  locator.registerSingleton<SignInWithEmailAndPasswordUseCase>(
      SignInWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignUpWithEmailAndPasswordUseCase>(
      SignUpWithEmailAndPasswordUseCase(locator()));
  locator.registerSingleton<SignOutUseCase>(SignOutUseCase(locator()));
  locator.registerSingleton<GetCurrentUserDataUseCase>(
      GetCurrentUserDataUseCase(locator()));
  locator.registerSingleton<GetContactsDataUseCase>(
      GetContactsDataUseCase(locator()));
  locator.registerSingleton<GetChatsDataUseCase>(
      GetChatsDataUseCase(locator()));
  locator.registerSingleton<GetMessagesDataUseCase>(
      GetMessagesDataUseCase(locator()));
  locator.registerSingleton<SendMessagesUseCase>(
     SendMessagesUseCase(locator()));

  ///Blocs
  locator.registerSingleton<LoginCubit>(
    LoginCubit(),
  );
  locator.registerSingleton<SignUpCubit>(
    SignUpCubit(),
  );
  locator.registerSingleton<AuthBloc>(
    AuthBloc(
      authCheckUseCase: locator(),
      signInWithEmailAndPasswordUseCase: locator(),
      signUpWithEmailAndPasswordUseCase: locator(),
      signOutUseCase: locator(),
    ),
  );
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      getCurrentUserDataUseCase: locator(),
    ),
  );
  locator.registerSingleton<ContactBloc>(
    ContactBloc(getContactsDataUseCase: locator()),
  );
  locator.registerSingleton<ChatBloc>(
    ChatBloc(getChatsDataUseCase: locator(), sendMessagesUseCase: locator()),
  );
}
