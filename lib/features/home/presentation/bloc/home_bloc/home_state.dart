part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final GetCurrentUserDataStatus getCurrentUserDataStatus;

  const HomeState({
    required this.getCurrentUserDataStatus,
  });

  HomeState copyWith({
    GetCurrentUserDataStatus? newGetCurrentUserDataStatus,
  }) {
    return HomeState(
      getCurrentUserDataStatus: newGetCurrentUserDataStatus ?? getCurrentUserDataStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [getCurrentUserDataStatus];
}