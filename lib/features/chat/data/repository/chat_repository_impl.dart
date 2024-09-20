
import 'package:chat_by_socket_samle/features/chat/data/models/chat_model.dart';
import 'package:chat_by_socket_samle/features/chat/data/models/model_converter.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/chat_model_entity.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/chat_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

import '../data_source/remote/chat_service_provider.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatServiceProvider chatServiceProvider;

  ChatRepositoryImpl(this.chatServiceProvider);

  @override
  Stream<DataState<ChatModelEntity>> fetchChatData(String chatId) async* {
    try {
      IO.Socket? socket = chatServiceProvider.socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<ChatModelEntity>> controller =
      StreamController();

      socket!.on('connect', (_) {
        socket.emit(
            'watchChatData', chatId); // Start listening for changes

        socket.on('chatDataChanged_$chatId', (updatedData) async {
          ChatModelEntity updatedChatData = chatModelToEntity(ChatModel.fromJson(updatedData));
          controller.add(DataSuccess(updatedChatData));
        });

        socket.on('error', (error) {
          controller.add(DataFailed('User data not found.'));
        });
      });

      // Handle stream closure
      controller.onCancel = () {
        socket.disconnect();
      };

      yield* controller.stream; // Yield the stream
    } catch (e) {
      yield DataFailed('Error: ${e.toString()}');
    }
  }
}