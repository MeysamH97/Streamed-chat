import 'dart:async';

import 'package:chat_by_socket_samle/features/chat/data/models/message_model.dart';
import 'package:chat_by_socket_samle/features/chat/domain/entities/message_model_entity.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../features/auth_service/data/models/current_user_model.dart';
import '../../features/auth_service/data/models/medel_converter.dart';
import '../../features/auth_service/data/models/other_user_model.dart';
import '../../features/auth_service/domain/entities/user_model_entity.dart';
import '../../features/chat/data/models/chat_model.dart';
import '../../features/chat/data/models/model_converter.dart';
import '../../features/chat/domain/entities/chat_model_entity.dart';
import 'current_user_provider.dart';
import 'data_state.dart';

String baseUrl = 'https://1cbf-13-53-216-239.ngrok-free.app'; // Sever address

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
          },
        ));

  Dio get dio => _dio;
}

class ApiServiceProvider {
  final ApiService _apiService = ApiService();

  // Sign in
  Future<Response> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _apiService.dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign up
  Future<Response> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _apiService.dio.post(
        '/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('sign up done');
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Sign out
  Future<Response> signOut(String userId) async {
    try {
      final response = await _apiService.dio.post(
        '/signout',
        data: {
          'userId': userId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Function to check if the token is valid
  Future<Response> checkToken(String userId) async {
    try {
      final token = await getToken();
      final response = await _apiService.dio.get(
        '/checkToken',
        data: {
          'userId': userId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // ارسال توکن در هدر
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    }
  }

  // Function to get currentUser data by userId
  Stream<DataState<CurrentUserEntity>> watchCurrentUserData(String userId,) async* {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<CurrentUserEntity>> controller =
          StreamController();
      socket!.on('connect', (_) {
        socket.emit(
            'watchCurrentUserData', userId); // Start listening for changes

        socket.on('currentUserDataChanged_$userId', (updatedData) async {
          CurrentUserEntity updatedUserData =
              currentUserToEntity(CurrentUserModel.fromJson(updatedData));
          CurrentUserProvider().setCurrentUser(updatedUserData);
          controller.add(DataSuccess(updatedUserData));
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

  // Function to get user data by userId
  Stream<DataState<OtherUserEntity>> watchOtherUserData(String userId,) async* {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<OtherUserEntity>> controller =
          StreamController();
      socket!.emit('watchOtherUserData', userId);
      socket.on('otherUserDataChanged_$userId', (updatedData) async {
        OtherUserEntity updatedUserData =
            otherUserToEntity(OtherUserModel.fromJson(updatedData));
        controller.add(DataSuccess(updatedUserData));
      });

      // Handle stream closure
      // controller.onCancel = () {
      //   socket.disconnect();
      // };

      yield* controller.stream; // Yield the stream
    } catch (e) {
      yield DataFailed('Error: ${e.toString()}');
    }
  }

  // Function to get chat data by chatId
  Stream<DataState<ChatModelEntity>> createNewChat(
      String userId, ChatModelEntity newChat) async* {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      socket!.emit('createChat', {
        'userId': userId,
        'chatId': newChat.id,
        'title': newChat.title,
        'admins': newChat.admins,
        'members': newChat.members,
        'type': newChat.type,
      });

      // گوش دادن به نتیجه ایجاد چت
      socket.on('chatCreated_$userId', (data) async* {
        if (data['success'] == true) {
          // چت با موفقیت ایجاد شده
          String createdChatId = data['chatId'];
          yield watchChatData(userId, createdChatId);
        } else {
          yield DataFailed('Error: ${data['error'].toString()}');
        }
      });
    } catch (e) {
      yield DataFailed('Error: ${e.toString()}');
    }
  }

  // Function to get chat data by chatId
  Stream<DataState<ChatModelEntity>> watchChatData(
      String userId, String chatId) async* {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<ChatModelEntity>> controller =
          StreamController();

      socket!.emit('watchChatData',
          {'userId': userId, 'chatId': chatId}); // Start listening for changes
      socket.on('chatDataChanged_${userId}_$chatId', (updatedData) {
        ChatModelEntity updatedChatData =
            chatModelToEntity(ChatModel.fromJson(updatedData));
        controller.add(DataSuccess(updatedChatData));
      });

      socket.on('error', (error) {
        controller.add(DataFailed('chat data not found.'));
      });

      // Handle stream closure
      // controller.onCancel = () {
      //   socket.disconnect();
      // };

      yield* controller.stream; // Yield the stream
    } catch (e) {
      yield DataFailed('Error: ${e.toString()}');
    }
  }

  // Function to get message data by messageId
  Stream<DataState<MessageModelEntity>> watchMessageData(
      String userId, String chatId, String messageId) async* {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<MessageModelEntity>> controller =
          StreamController();

      socket!.emit('watchMessageData', {
        'userId': userId,
        'chatId': chatId,
        'messageId': messageId
      }); // Start listening for changes

      socket.on('messageDataChanged_${userId}_${chatId}_$messageId',
          (updatedData) {
        MessageModelEntity updatedChatData =
            messageModelToEntity(MessageModel.fromJson(updatedData));
        controller.add(DataSuccess(updatedChatData));
      });

      socket.on('error', (error) {
        controller.add(DataFailed('Message data not found.'));
      });

      // // Handle stream closure
      // controller.onCancel = () {
      //   socket.disconnect();
      // };

      yield* controller.stream; // Yield the stream
    } catch (e) {
      yield DataFailed('Error: ${e.toString()}');
    }
  }

  Future<DataState<Map<String, dynamic>>> sendMessage(
      String userId,
      String chatId,
      MessageModelEntity message,
      ) async {
    try {
      final socketProvider = SocketProvider();
      IO.Socket? socket = socketProvider.connectSocket();

      // تعریف Completer برای مدیریت نتیجه
      final Completer<DataState<Map<String, dynamic>>> completer = Completer();

      var messageTime = {
        'seconds': message.time.seconds,
        'nanoseconds': message.time.nanoseconds,
      };

      // ایجاد پیام جدید
      var newMessage = {
        'id': message.id,
        'sender': message.sender,
        'content': message.content,
        'time': messageTime,
        'type': message.type.name,
      };

      // ارسال پیام به سوکت
      socket!.emit('sendMessage', {
        'userId': userId,
        'chatId': chatId,
        'message': newMessage,
      });

      // گوش دادن به نتیجه ارسال پیام
      socket.on('messageSent_${userId}_$chatId', (data) {
        if (!completer.isCompleted) {
          if(data['success']){
            completer.complete(DataSuccess(data));
          }else{
            completer.complete(DataFailed(data['error']));
          }

        }
      });

      // گوش دادن به خطاها
      socket.on('error', (error) {
        if (!completer.isCompleted) {
          completer.complete(DataFailed('Message not sent: ${error.toString()}'));
        }
      });

      // زمانبندی برای جلوگیری از بی‌پایان ماندن درخواست (Timeout)
      Future.delayed(const Duration(seconds: 15), () {
        if (!completer.isCompleted) {
          completer.complete(DataFailed('Message send timed out.'));
        }
      });

      // منتظر تکمیل شدن نتیجه
      final result = await completer.future;

      // // قطع اتصال سوکت
      // socket.disconnect();

      return result;
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}

class SocketProvider {
  IO.Socket? connectSocket() {
    return IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });
  }
}
