import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/login_cubit.dart';
import 'package:chat_by_socket_samle/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth_service/presentation/bloc/auth_bloc.dart';
import '../../features/auth_service/presentation/bloc/auth_status.dart';
import '../../features/auth_service/presentation/bloc/signUp_cubit.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/screens/home.dart';
import '../pages_routs/loginOrSignUp.dart';
import '../resources/custom_sizes.dart';
import 'loading_widget.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key, this.userId});

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.authStatus is AuthLoading) {
          BlocProvider.of<AuthBloc>(context).add(AuthCheckEvent(userId));
          return Center(
            child: LoadingWidget(
              size: CustomSize(context).shapeLevel5(),
            ),
          );
        }
        if (state.authStatus is AuthCompleted) {
          final AuthCompleted authCompleted = state.authStatus as AuthCompleted;
          return BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(locator()),
            child: Home(
              currentUserId: authCompleted.userModelEntity.id,
            ),
          );
        }
        if (state.authStatus is AuthError) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(
                create: (_) => locator(),
              ),
              BlocProvider<SignUpCubit>(
                create: (_) => locator(),
              ),
              BlocProvider<HomeBloc>(
                create: (_) => HomeBloc(locator()),
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
