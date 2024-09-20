part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetCurrentUserDataEvent extends HomeEvent {
  final String userId;

  GetCurrentUserDataEvent(this.userId);
}

class GetContactsDataEvent extends HomeEvent {
  final List<String> contacts;

  GetContactsDataEvent(this.contacts);
}


