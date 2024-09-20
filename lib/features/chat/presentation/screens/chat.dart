import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/widgets/custom_text_field_and_send_message.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/custom_sizes.dart';
import '../../../home/presentation/bloc/contact_bloc/contact_bloc.dart';
import '../../../home/presentation/bloc/contact_bloc/get_contacts_data_status.dart';

class PrivateChat extends StatefulWidget {
  const PrivateChat({super.key, required this.otherUser});

  final OtherUserEntity otherUser;

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactBloc>(context)
        .add(GetContactDataEvent(widget.otherUser.id));
  }

  @override
  Widget build(BuildContext context) {
    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;

    return BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state.getContactsDataStatus is GetContactsDataCompleted) {
            final otherUser =
                (state.getContactsDataStatus as GetContactsDataCompleted)
                    .contact;
            return Scaffold(
              appBar: CustomAppBar(
                context: context,
                avatar: (otherUser.profilePictureUrl != null &&
                        otherUser.profilePictureUrl != '')
                    ? Image.network(
                        otherUser.profilePictureUrl!,
                        width: size.shapeLevel5() * 2,
                        height: size.shapeLevel5() * 2,
                        fit: BoxFit.fill,
                      )
                    : Icon(
                        Icons.person,
                        color: color.onPrimary,
                        size: size.shapeLevel5(),
                      ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otherUser.username ?? otherUser.email,
                      style: TextStyle(
                        fontSize: size.textLevel6(),
                        color: color.primary,
                      ),
                    ),
                    SizedBox(
                      height: size.verticalSpaceLevel7(),
                    ),
                    Text(
                      otherUser.isOnline ? 'Online' : 'last seen recently',
                      style: TextStyle(
                        fontSize: size.textLevel7(),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(child: Column()),
                  CustomSendMessageBar(
                      textFieldController: textFieldController),
                ],
              ),
            );
          } else {
            final otherUser = widget.otherUser;
            return Scaffold(
              appBar: CustomAppBar(
                context: context,
                avatar: (otherUser.profilePictureUrl != null &&
                        otherUser.profilePictureUrl != '')
                    ? Image.network(
                        otherUser.profilePictureUrl!,
                        width: size.shapeLevel5() * 2,
                        height: size.shapeLevel5() * 2,
                        fit: BoxFit.fill,
                      )
                    : Icon(
                        Icons.person,
                        color: color.onPrimary,
                        size: size.shapeLevel5(),
                      ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otherUser.username ?? otherUser.email,
                      style: TextStyle(
                        fontSize: size.textLevel6(),
                        color: color.primary,
                      ),
                    ),
                    SizedBox(
                      height: size.verticalSpaceLevel7(),
                    ),
                    Text(
                      otherUser.isOnline ? 'Online' : 'last seen recently',
                      style: TextStyle(
                        fontSize: size.textLevel7(),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(child: Column()),
                  CustomSendMessageBar(
                      textFieldController: textFieldController),
                ],
              ),
            );
          }
        },
      );
  }
}
