import '../entities/user_profile.dart';
import '../repositories/user_repository.dart';

class GetUserProfilesUseCase {
  final UserRepository repository;

  GetUserProfilesUseCase(this.repository);

  Future<List<UserProfile>> execute() async {
    return await repository.getUserProfiles();
  }
}
