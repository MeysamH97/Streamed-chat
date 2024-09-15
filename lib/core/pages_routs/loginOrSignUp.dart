import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth_service/presentation/screens/signIn.dart';
import '../../features/auth_service/presentation/screens/signUp.dart';
import '../../features/home/presentation/bloc/home_bloc/home_bloc.dart';
import '../../locator.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => locator<HomeBloc>(),
      child: Scaffold(
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250), // مدت زمان انیمیشن
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0), // موقعیت شروع (از سمت راست)
                  end: const Offset(0.0, 0.0), // موقعیت پایان (مرکز)
                ).animate(animation),
                child: child,
              );
            },
            child: showLogin
                ? SignInPage(
                    switchPage: togglePages,
                  )
                : SignUpPage(
                    switchPage: togglePages,
                  ),
          ),
        ),
      ),
    );
  }
}
