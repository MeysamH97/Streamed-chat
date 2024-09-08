import 'package:chat_by_socket_samle/core/widgets/custom_button.dart';
import 'package:chat_by_socket_samle/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/custom_sizes.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/signUp_cubit.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key, required this.switchPage});

  final void Function()? switchPage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();
  final bool signUpValidation = false;

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

              //message
              Text(
                'Let\'s creat an account for you',
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
                  context.read<SignUpCubit>().checkFields(emailController.text,
                      passwordController.text, verifyPasswordController.text);
                },
                hintText: 'Email ...',
              ),

              SizedBox(
                height: CustomSize(context).verticalSpaceLevel8(),
              ),

              CustomTextField(
                controller: passwordController,
                onChanged: (p0) {
                  context.read<SignUpCubit>().checkFields(emailController.text,
                      passwordController.text, verifyPasswordController.text);
                },
                hintText: 'Password ...',
                obscureText: true,
              ),

              SizedBox(
                height: CustomSize(context).verticalSpaceLevel8(),
              ),

              CustomTextField(
                controller: verifyPasswordController,
                onChanged: (p0) {
                  context.read<SignUpCubit>().checkFields(emailController.text,
                      passwordController.text, verifyPasswordController.text);
                },
                hintText: 'Verify your password ...',
                obscureText: true,
              ),

              //sign in button
              BlocBuilder<SignUpCubit, SignUpButtonState>(
                  builder: (context, state) {
                return CustomButton(
                  text: 'Register',
                  onTap: state == SignUpButtonState.loading
                      ? null // Disable button when loading
                      : () {
                    context.read<SignUpCubit>().setLoading(); // Set loading state
                    signUp(context); // Perform login
                  },
                  isActive: state == SignUpButtonState.enabled,
                  isLoading: state == SignUpButtonState.loading,
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
                    'Already have an account?',
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
                      'Sign In',
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

  signUp(context) {
    BlocProvider.of<AuthBloc>(context).add(
      SignUpWithEmailAndPasswordEvent(
        emailController.text,
        passwordController.text,
      ),
    );
  }
}
