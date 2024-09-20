import 'package:chat_by_socket_samle/core/resources/custom_sizes.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../bloc/contact_bloc/contact_bloc.dart';
import '../bloc/contact_bloc/get_contacts_data_status.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key, this.onTap, required this.contactId});

  final void Function()? onTap;
  final String contactId;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactBloc>(context)
        .add(GetContactDataEvent(widget.contactId));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state.getContactsDataStatus is GetContactsDataCompleted) {
          final user =
              (state.getContactsDataStatus as GetContactsDataCompleted).contact;

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<ContactBloc>(
                  create: (context) => ContactBloc(getContactsDataUseCase: locator()),
                  child: PrivateChat(otherUser: user),
                ),
              ),
            ),
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSize(context).horizontalSpaceLevel4(),
                  vertical: CustomSize(context).verticalSpaceLevel7(),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: CustomSize(context).horizontalSpaceLevel5(),
                  vertical: CustomSize(context).verticalSpaceLevel8() / 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.tertiary,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: CustomSize(context).shapeLevel6(),
                          child: (user.profilePictureUrl != '' &&
                                  user.profilePictureUrl != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      CustomSize(context).shapeLevel6()),
                                  child: Image.network(
                                    user.profilePictureUrl!,
                                    width:
                                        CustomSize(context).shapeLevel6() * 2,
                                    height:
                                        CustomSize(context).shapeLevel6() * 2,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Icon(
                                  Icons.person,
                                  size: CustomSize(context).shapeLevel5(),
                                ),
                        ),
                        if (user.isOnline) ...[
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: CustomSize(context).shapeLevel7() / 3,
                            ),
                          )
                        ],
                      ],
                    ),
                    SizedBox(
                      width: CustomSize(context).horizontalSpaceLevel5(),
                    ),
                    Text(
                      user.username ?? user.email,
                      style: TextStyle(
                        fontSize: CustomSize(context).textLevel6(),
                        color: color.inversePrimary,
                      ),
                    ),
                  ],
                )),
          );
        }

        if (state.getContactsDataStatus is GetContactsDataError) {
          final error =
              (state.getContactsDataStatus as GetContactsDataError).message;
          return Text(error);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
