import 'package:equatable/equatable.dart';
import '../../domain/entities/user_profile.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<UserProfile> users;
  final int currentIndex;

  const HomeLoaded({
    required this.users,
    this.currentIndex = 0,
  });

  UserProfile get currentUser => users[currentIndex];

  HomeLoaded copyWith({
    List<UserProfile>? users,
    int? currentIndex,
  }) {
    return HomeLoaded(
      users: users ?? this.users,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [users, currentIndex];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
