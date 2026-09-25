import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/random_user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final RandomUserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserProfile>> getUserProfiles() async {
    final models = await remoteDataSource.fetchUsers();
    return models.asMap().entries.map((e) => e.value.toEntity(e.key)).toList();
  }
}
