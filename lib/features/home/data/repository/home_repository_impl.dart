import 'package:chat_by_socket_samle/features/auth_service/data/models/current_user_model.dart';
import 'package:chat_by_socket_samle/features/auth_service/data/models/medel_converter.dart';
import 'package:chat_by_socket_samle/features/home/data/data_source/remote/home_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';
import '../../domain/repository/home_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

class HomeRepositoryImpl extends HomeRepository {
  final HomeServiceProvider homeServiceProvider;

  HomeRepositoryImpl(this.homeServiceProvider);

  @override
  Stream<DataState<UserModelEntity>> fetchCurrentUserData(String userId) async* {
    try {
      IO.Socket? socket = homeServiceProvider.socketProvider.connectSocket();

      // Use a StreamController to manage stream data
      final StreamController<DataState<UserModelEntity>> controller = StreamController();

      socket!.on('connect', (_) {

        socket.emit('watchUserData', userId); // Start listening for changes

        socket.on('documentChanged', (updatedData) async {
          CurrentUserEntity updatedUserData = await currentUserToEntity(CurrentUserModel.fromJson(updatedData));
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
