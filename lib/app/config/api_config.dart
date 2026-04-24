class ApiConfig {
  ApiConfig._();
  static const String baseUrl = 'http://192.168.1.67:3000';
  //static const String baseUrl = 'http://10.10.202.28:3000';
  static const String internalBaseUrl = 'http://www.centrecities.com:3190';

  static const String authPath = '/api/auth';
  static const String apiInternalPath = '/api_internal';
  static const String usersPath = '/api/users';
  static const String getAllUsersPath = '$usersPath/getAllUsers';
  static const String getReportPath = '$apiInternalPath/getReport';
  static const String getRolesPath = '$usersPath/getRole';
  static const String loginPath = '$authPath/login';
  static const String logoutPath = '$authPath/logout';
  static const String refreshPath = '$authPath/refresh';
  static const String changePasswordPath = '$authPath/changePassword';

  static String url(String path) => '$baseUrl$path';
  static String internalUrl(String path) => '$internalBaseUrl$path';

  static Uri uri(String path) => Uri.parse(url(path));
  static Uri internalUri(String path) => Uri.parse(internalUrl(path));

  static String get getAllUsersUrl => url(getAllUsersPath);
  static String get getReportUrl => internalUrl(getReportPath);
  static String get getRolesUrl => url(getRolesPath);
  static String get loginUrl => url(loginPath);
  static String get logoutUrl => url(logoutPath);
  static String get refreshUrl => url(refreshPath);
  static String get changePasswordUrl => url(changePasswordPath);

  static Uri get getAllUsersUri => uri(getAllUsersPath);
  static Uri get getReportUri => internalUri(getReportPath);
  static Uri get getRolesUri => uri(getRolesPath);
  static Uri get loginUri => uri(loginPath);
  static Uri get logoutUri => uri(logoutPath);
  static Uri get refreshUri => uri(refreshPath);
  static Uri get changePasswordUri => uri(changePasswordPath);
}
