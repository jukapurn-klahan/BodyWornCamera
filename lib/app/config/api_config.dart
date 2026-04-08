class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'http://10.10.202.26:3000';

  static const String usersPath = '/api/users';
  static const String getAllUsersPath = '$usersPath/getAllUsers';
  static const String loginPath = '$usersPath/login';

  static String url(String path) => '$baseUrl$path';

  static Uri uri(String path) => Uri.parse(url(path));

  static String get getAllUsersUrl => url(getAllUsersPath);
  static String get loginUrl => url(loginPath);

  static Uri get getAllUsersUri => uri(getAllUsersPath);
  static Uri get loginUri => uri(loginPath);
}
