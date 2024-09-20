import 'package:chat_by_socket_samle/features/home/presentation/bloc/contact_bloc/contact_bloc.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/user_tile.dart';
import 'package:chat_by_socket_samle/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/custom_sizes.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key, required this.contacts});

  final List<String> contacts;

  @override
  Widget build(BuildContext context) {

    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(
          'Contacts',
          style: TextStyle(
            fontSize: size.textLevel4()/2,
            color: color.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contactId = contacts[index];

          return BlocProvider<ContactBloc>(
            create: (context) => ContactBloc(
              getContactsDataUseCase:
                  locator(), // دریافت یوز کیس از DI یا Parent Bloc
            ),
            child: UserTile(
              contactId: contactId,
            ),
          );
        },
      ),
    );
  }
}
