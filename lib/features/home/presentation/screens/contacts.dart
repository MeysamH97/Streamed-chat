import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        context: context,
        titleText: 'Contacts',),
    );
  }
}
