import 'package:bloc/bloc.dart';
import 'package:chat_by_socket_samle/features/home/presentation/bloc/contact_bloc/get_contacts_data_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/use_cases/get_current_user_data_use_case.dart';
import 'get_current_user_data_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentUserDataUseCase getCurrentUserDataUseCase;

  HomeBloc({
    required this.getCurrentUserDataUseCase,
  }) : super(
          HomeState(
            getCurrentUserDataStatus: GetCurrentUserDataLoading(),
          ),
        ) {
    on<GetCurrentUserDataEvent>(
      (event, emit) async {
        // Listen to the stream for updates
        await for (final dataState in getCurrentUserDataUseCase(event.userId)) {
          if (dataState is DataSuccess) {
            emit(
              state.copyWith(
                newGetCurrentUserDataStatus:
                    GetCurrentUserDataCompleted(dataState.data!),
              ),
            );
          } else if (dataState is DataFailed) {
            emit(
              state.copyWith(
                newGetCurrentUserDataStatus:
                    GetCurrentUserDataError(dataState.error!),
              ),
            );
          }
        }
      },
    );

  }
}
