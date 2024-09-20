import 'package:chat_by_socket_samle/features/auth_service/data/models/current_user_model.dart';
import 'package:chat_by_socket_samle/features/auth_service/data/models/medel_converter.dart';
import 'package:chat_by_socket_samle/features/auth_service/data/models/other_user_model.dart';
import 'package:chat_by_socket_samle/features/home/data/data_source/remote/home_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/current_user_provider.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';
import '../../domain/repository/home_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

class HomeRepositoryImpl extends HomeRepository {
  final HomeServiceProvider homeServiceProvider;

  HomeRepositoryImpl(this.homeServiceProvider);

  @override
  Stream<DataState<CurrentUserEntity>> fetchCurrentUserData(String userId) async* {
    try {
      IO.Socket? socket = homeServiceProvider.socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<CurrentUserEntity>> controller =
          StreamController();

      socket!.on('connect', (_) {
        socket.emit('watchCurrentUserData', userId); // Start listening for changes

        socket.on('userDataFetched', (data) async {
          CurrentUserEntity currentUserData =
              await currentUserToEntity(CurrentUserModel.fromJson(data));

          controller.add(DataSuccess(currentUserData));
        });

        socket.on('currentUserDataChanged', (updatedData) async {
          CurrentUserEntity updatedUserData =
              await currentUserToEntity(CurrentUserModel.fromJson(updatedData));
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


  @override
  Stream<DataState<OtherUserEntity>> fetchOtherUserData(String userId) async* {
    try {
      IO.Socket? socket = homeServiceProvider.socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<OtherUserEntity>> controller =
          StreamController();
      socket!.emit('watchOtherUserData', userId);
      socket.on('otherUserDataChanged_$userId', (updatedData) async {
        OtherUserEntity updatedUserData = otherUserToEntity(OtherUserModel.fromJson(updatedData));
        controller.add(DataSuccess(updatedUserData));
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



  @override
  Future<DataState<String>> signOut(String userId) async {
    try {
      Response response = await homeServiceProvider.signOut(userId);
      if (response.data != null) {
        await removeLoginData();
        return DataSuccess(response.data['message']);
      } else {
        return DataFailed('Sign Out failed.');
      }
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }

  // حذف توکن از SharedPreferences
  Future<void> removeLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('auth_token');
  }
}
