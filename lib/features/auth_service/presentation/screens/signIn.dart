import 'package:chat_by_socket_samle/core/widgets/custom_button.dart';
import 'package:chat_by_socket_samle/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/custom_sizes.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login_cubit.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key, required this.switchPage});

  final void Function()? switchPage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool signInValidation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo
                  Icon(
                    Icons.message_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: CustomSize(context).shapeLevel3(),
                  ),

                  SizedBox(
                    height: CustomSize(context).verticalSpaceLevel6(),
                  ),

                  //welcome text
                  Text(
                    'Welcome To My Chat Room',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: CustomSize(context).textLevel6(),
                    ),
                  ),

                  SizedBox(
                    height: CustomSize(context).verticalSpaceLevel4(),
                  ),

                  //sign in inputs
                  CustomTextField(
                    controller: emailController,
                    onChanged: (p0) {
                      context.read<LoginCubit>().checkFields(
                          emailController.text, passwordController.text);
                    },
                    hintText: 'Email ...',
                  ),

                  SizedBox(
                    height: CustomSize(context).verticalSpaceLevel8(),
                  ),

                  CustomTextField(
                    controller: passwordController,
                    onChanged: (p0) {
                      context.read<LoginCubit>().checkFields(
                          emailController.text, passwordController.text);
                    },
                    hintText: 'Password ...',
                    obscureText: true,
                  ),

                  //sign in button
                  BlocBuilder<LoginCubit, LoginButtonState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: 'Login',
                          onTap: state == LoginButtonState.loading
                              ? null // Disable button when loading
                              : () {
                            context.read<LoginCubit>().setLoading(); // Set loading state
                            logIn(context); // Perform login
                          },
                          isActive: state == LoginButtonState.enabled,
                          isLoading: state == LoginButtonState.loading, // Show loading indicator
                        );
                      }),

                  //remember me checkbox

                  SizedBox(
                    height: CustomSize(context).verticalSpaceLevel8(),
                  ),
                  //go for sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: CustomSize(context).textLevel7(),
                        ),
                      ),
                      SizedBox(
                        width: CustomSize(context).horizontalSpaceLevel7(),
                      ),
                      GestureDetector(
                        onTap: () => switchPage!(),
                        child: Text(
                          'Register now',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: CustomSize(context).textLevel7(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
  }

  logIn(context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthenticationWithEmailAndPasswordEvent(
        emailController.text,
        passwordController.text,
      ),
    );
  }
}
