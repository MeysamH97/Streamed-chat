import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_contacts_data_use_case.dart';
import 'get_contacts_data_status.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsDataUseCase getContactsDataUseCase;

  ContactBloc({required this.getContactsDataUseCase})
      : super(
          ContactState(
            getContactsDataStatus: GetContactsDataLoading(),
          ),
        ) {

    on<GetContactDataEvent>((event, emit) async{

      await for (final dataState in getContactsDataUseCase(event.contactId)) {

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newGetContactsDataStatus:
              GetContactsDataCompleted(dataState.data!),
            ),
          );
        } else if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newGetContactsDataStatus:
              GetContactsDataError(dataState.error!),
            ),
          );
        }
      }
    });
  }
}
