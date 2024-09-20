part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final GetContactsDataStatus getContactsDataStatus;

  const ContactState({
    required this.getContactsDataStatus,
  });

  ContactState copyWith({
    GetContactsDataStatus? newGetContactsDataStatus,
  }) {
    return ContactState(
      getContactsDataStatus: newGetContactsDataStatus ?? getContactsDataStatus,
    );
  }

  @override
  List<Object?> get props => [getContactsDataStatus];
}

