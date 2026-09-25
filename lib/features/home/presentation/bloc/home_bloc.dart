import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_user_profiles_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserProfilesUseCase getUserProfilesUseCase;

  HomeBloc({required this.getUserProfilesUseCase}) : super(const HomeInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
    on<RefreshUsersEvent>(_onRefreshUsers);
    on<NextProfileEvent>(_onNextProfile);
    on<PreviousProfileEvent>(_onPreviousProfile);
    on<SelectProfileIndexEvent>(_onSelectProfileIndex);
  }

  Future<void> _onFetchUsers(FetchUsersEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final users = await getUserProfilesUseCase.execute();
      if (users.isEmpty) {
        emit(const HomeError("No profiles available. Pull down to refresh."));
      } else {
        emit(HomeLoaded(users: users, currentIndex: 0));
      }
    } catch (e) {
      emit(HomeError(e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> _onRefreshUsers(RefreshUsersEvent event, Emitter<HomeState> emit) async {
    try {
      final users = await getUserProfilesUseCase.execute();
      if (state is HomeLoaded) {
        final current = (state as HomeLoaded);
        emit(current.copyWith(users: users));
      } else {
        emit(HomeLoaded(users: users, currentIndex: 0));
      }
    } catch (e) {
      if (state is! HomeLoaded) {
        emit(HomeError(e.toString().replaceAll("Exception: ", "")));
      }
    }
  }

  void _onNextProfile(NextProfileEvent event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final s = state as HomeLoaded;
      if (s.currentIndex < s.users.length - 1) {
        emit(s.copyWith(currentIndex: s.currentIndex + 1));
      }
    }
  }

  void _onPreviousProfile(PreviousProfileEvent event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final s = state as HomeLoaded;
      if (s.currentIndex > 0) {
        emit(s.copyWith(currentIndex: s.currentIndex - 1));
      }
    }
  }

  void _onSelectProfileIndex(SelectProfileIndexEvent event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final s = state as HomeLoaded;
      if (event.index >= 0 && event.index < s.users.length) {
        emit(s.copyWith(currentIndex: event.index));
      }
    }
  }
}
