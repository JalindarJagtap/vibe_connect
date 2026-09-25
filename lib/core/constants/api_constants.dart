class ApiConstants {
  static const String baseUrl = 'https://randomuser.me/api/';
  static const String homeUsersEndpoint = '?results=20';

  static Uri get homeUsersUri => Uri.parse('$baseUrl$homeUsersEndpoint');
}
