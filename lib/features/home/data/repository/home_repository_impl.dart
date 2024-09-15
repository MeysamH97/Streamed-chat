import 'package:chat_by_socket_samle/features/home/data/data_source/remote/socket_provider.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth_service/data/models/user_model.dart';
import '../../../auth_service/domain/entities/user_model_entity.dart';
import '../../domain/repository/home_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';

class HomeRepositoryImpl extends HomeRepository {
  final SocketProvider socketProvider;

  HomeRepositoryImpl(this.socketProvider);

  @override
  Future<DataState<UserModelEntity>> fetchCurrentUserData(String userId) async {
    final completer = Completer<DataState<UserModelEntity>>(); // Initialize Completer

    try {
      IO.Socket? socket = socketProvider.connectSocket();
      socket!.on('connect', (_) {
        print('Connected to socket server');
        socket.emit('fetchUserData', userId);
        print('fetching User Data ... ');

        socket.on('userDataFetched', (data) {
          print('User Data fetched... ');
          UserModelEntity currentUserData = UserModel.fromJson(data).toEntity();
          completer.complete(DataSuccess(currentUserData)); // Complete the future
        });

        socket.on('error', (error) {
          completer.complete(DataFailed('User data not found.')); // Complete with error
        });
      });
      return completer.future; // Wait for the future to complete
    } catch (e) {
      return DataFailed('Error: ${e.toString()}');
    }
  }
}
