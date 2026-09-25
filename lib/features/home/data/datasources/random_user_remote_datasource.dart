import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../models/random_user_model.dart';

abstract class RandomUserRemoteDataSource {
  Future<List<RandomUserModel>> fetchUsers();
}

class RandomUserRemoteDataSourceImpl implements RandomUserRemoteDataSource {
  final http.Client client;

  RandomUserRemoteDataSourceImpl({http.Client? client})
      : client = client ?? http.Client();

  @override
  Future<List<RandomUserModel>> fetchUsers() async {
    final response = await client.get(
      ApiConstants.homeUsersUri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'] ?? [];
      return results
          .asMap()
          .entries
          .map((entry) => RandomUserModel.fromJson(entry.value, entry.key))
          .toList();
    } else {
      throw Exception('Failed to load profiles (HTTP ${response.statusCode})');
    }
  }
}
