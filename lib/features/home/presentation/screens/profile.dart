import 'package:chat_by_socket_samle/core/resources/current_user_provider.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
   Profile({super.key});

  final CurrentUserEntity? currentUser = CurrentUserProvider().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(children: [
        Text(currentUser!.email),
        Text(currentUser!.isOnline.toString()),
        Text(currentUser!.password),
      ],)
    );
  }
}
