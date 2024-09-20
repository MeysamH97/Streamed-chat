import 'dart:async';

import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';

class CurrentUserProvider {
  static final CurrentUserProvider _instance = CurrentUserProvider._internal();
  CurrentUserEntity? _currentUser;
  final StreamController<CurrentUserEntity?> _currentUserStreamController =
  StreamController.broadcast();

  factory CurrentUserProvider() {
    return _instance;
  }

  CurrentUserProvider._internal();

  Stream<CurrentUserEntity?> get currentUserStream =>
      _currentUserStreamController.stream;

  void setCurrentUser(CurrentUserEntity user) {
    _currentUser = user;
    _currentUserStreamController.add(_currentUser);  // ارسال کاربر جدید به Stream
  }

  CurrentUserEntity? getCurrentUser() {
    return _currentUser;
  }

  void dispose() {
    _currentUserStreamController.close();
  }
}
