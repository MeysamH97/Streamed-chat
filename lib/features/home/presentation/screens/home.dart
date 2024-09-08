import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';
import 'package:chat_by_socket_samle/features/auth_service/presentation/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  final UserModelEntity currentUser;

  const Home({super.key, required this.currentUser});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcom To Home Screen',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('User Email : ${widget.currentUser.email}'),
            SizedBox(
              height: 20,
            ),
            Text('User Id : ${widget.currentUser.id}'),
            SizedBox(
              height: 50,
            ),
            IconButton(
                onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                      SignOutEvent(FirebaseAuth.instance),
                    ),
                icon: Icon(Icons.logout,size: 35,))
          ],
        ),
      ),
    );
  }
}
