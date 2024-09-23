import 'package:chat_by_socket_samle/core/widgets/loading_widget.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/data/models/message_model.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/bloc/chat_bloc/get_chats_data_status.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/widgets/custom_send_message_bar.dart';
import 'package:chat_by_socket_samle/features/chat/presentation/widgets/message_bubble.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/custom_sizes.dart';
import '../../../../locator.dart';
import '../../../home/presentation/bloc/contact_bloc/contact_bloc.dart';
import '../../../home/presentation/bloc/contact_bloc/get_contacts_data_status.dart';

class PrivateChat extends StatefulWidget {
  const PrivateChat({super.key, required this.otherUser});

  final OtherUserEntity otherUser;

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> with AutomaticKeepAliveClientMixin {
  TextEditingController textFieldController = TextEditingController();
  ScrollController messagesController = ScrollController();

  late String? currentUserId;
  late String? chatId;
  List<String> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactBloc>(context)
        .add(GetContactDataEvent(widget.otherUser.id));
    loadChatData();
  }

  loadChatData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserId = prefs.getString('userId');
    List<String> users = [currentUserId!, widget.otherUser.id]
      ..sort(); // مرتب‌سازی id کاربران
    chatId = users.join('_');
    BlocProvider.of<ChatBloc>(context)
        .add(GetChatDataEvent(currentUserId!, chatId!));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state.getContactsDataStatus is GetContactsDataCompleted) {
          final otherUser =
              (state.getContactsDataStatus as GetContactsDataCompleted).contact;
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
                      color: otherUser.isOnline ? Colors.blue : color.primary,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
                  if (state.getChatsDataStatus is GetChatsDataLoading) {
                    print('Step 1');
                    return Expanded(
                      child: LoadingWidget(size: size.shapeLevel5()),
                    );
                  }

                  if (state.getChatsDataStatus is GetChatsDataCompleted) {
                    print('Step 2');
                    final chat =
                        (state.getChatsDataStatus as GetChatsDataCompleted)
                            .chat;
                    print('Step 3');
                    if (chat.messages != null) {
                      messages = chat.messages!;
                      messagesController = ScrollController();
                      return Expanded(
                        child: ListView.builder(
                          itemCount: chat.messages!.length,
                          physics: const BouncingScrollPhysics(),
                          controller: messagesController,
                          itemBuilder: (context, index) {
                            return BlocProvider<MessageBloc>(
                                create: (context) => MessageBloc(
                                      getMessagesDataUseCase:
                                          locator(), // دریافت یوز کیس از DI یا Parent Bloc
                                    ),
                                child: MessageBubble(
                                  currentUserId: currentUserId!,
                                  chatId: chatId!,
                                  messageId: messages[index],
                                ));
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                          child: Center(
                        child: Text('No messages yet'),
                      ));
                    }
                  }
                  if (state.getChatsDataStatus is GetChatsDataError) {
                    return Expanded(
                        child: Center(
                      child: Text(
                          'Error : ${(state.getChatsDataStatus as GetChatsDataError).message.toString()}'),
                    ));
                  }
                  print('noOne');
                  return const SizedBox.shrink();
                }),
                CustomSendMessageBar(
                  textFieldController: textFieldController,
                  onSend: () {
                    if (textFieldController.text.isNotEmpty) {
                      sendMessage();
                    }
                  },
                ),
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
                      color: otherUser.isOnline ? Colors.blue : color.primary,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                CustomSendMessageBar(
                  textFieldController: textFieldController,
                  onSend: () {
                    if (textFieldController.text.isNotEmpty) {
                      sendMessage();
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  sendMessage() {
    MessageModelEntity newMessage = MessageModelEntity(
      id: '',
      sender: currentUserId!,
      content: textFieldController.text,
      time: Timestamp.now(),
      type: MessageType.text,
    );
    BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(
        newMessage: newMessage, userId: currentUserId!, chatId: chatId!));
    textFieldController.clear();
    if (messagesController.hasClients){
    messagesController.animateTo(
      messagesController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );}
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
