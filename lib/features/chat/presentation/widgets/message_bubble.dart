import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/message_bloc/get_messages_data_status.dart';
import '../bloc/message_bloc/message_bloc.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble(
      {super.key,
      required this.currentUserId,
      required this.chatId,
      required this.messageId});

  final String currentUserId;
  final String chatId;
  final String messageId;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MessageBloc>(context).add(GetMessageDataEvent(
        widget.currentUserId, widget.chatId, widget.messageId));
  }

  @override
  Widget build(BuildContext context) {
   var color =  Theme.of(context).colorScheme;
    return BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
      if (state.getMessagesDataStatus is GetMessagesDataCompleted) {
        final message =
            (state.getMessagesDataStatus as GetMessagesDataCompleted).message;
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: message.sender == widget.currentUserId
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: message.sender == widget.currentUserId
                      ? color.tertiary : color.primary,
                  borderRadius:  BorderRadius.only(
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                    topLeft: message.sender == widget.currentUserId
                        ? const Radius.circular(10): const Radius.circular(0),
                    topRight: message.sender == widget.currentUserId
                        ? const Radius.circular(0): const Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Text(message.content,style: TextStyle(color: message.sender == widget.currentUserId
                        ? color.inversePrimary : color.tertiary),),
                  ],
                )),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
