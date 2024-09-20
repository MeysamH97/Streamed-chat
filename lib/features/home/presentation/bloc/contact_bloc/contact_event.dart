part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class GetContactDataEvent extends ContactEvent {
  final String contactId;

  GetContactDataEvent(this.contactId);
}