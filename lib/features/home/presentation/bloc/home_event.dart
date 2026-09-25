import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsersEvent extends HomeEvent {
  const FetchUsersEvent();
}

class RefreshUsersEvent extends HomeEvent {
  const RefreshUsersEvent();
}

class NextProfileEvent extends HomeEvent {
  const NextProfileEvent();
}

class PreviousProfileEvent extends HomeEvent {
  const PreviousProfileEvent();
}

class SelectProfileIndexEvent extends HomeEvent {
  final int index;
  const SelectProfileIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}
