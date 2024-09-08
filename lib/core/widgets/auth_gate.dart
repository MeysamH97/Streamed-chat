import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth_service/presentation/bloc/auth_bloc.dart';
import '../../features/auth_service/presentation/bloc/auth_status.dart';
import '../../features/auth_service/presentation/bloc/signUp_cubit.dart';
import '../../features/home/presentation/screens/home.dart';
import '../pages_routs/loginOrSignUp.dart';
import '../resources/custom_sizes.dart';
import 'loading_widget.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.authStatus is AuthLoading) {
          BlocProvider.of<AuthBloc>(context).add(AuthCheckEvent(auth));
          return Center(
            child: LoadingWidget(
              size: CustomSize(context).shapeLevel5(),
            ),
          );
        }
        if (state.authStatus is AuthCompleted) {
          final AuthCompleted authCompleted = state.authStatus as AuthCompleted;
          return Home(
            currentUser: authCompleted.userModelEntity,
          );
        }
        if (state.authStatus is AuthError) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(
                create: (_) => LoginCubit(),
              ),
              BlocProvider<SignUpCubit>(
                create: (_) => SignUpCubit(),
              ),
            ],
            child: const LoginOrSignUp(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
