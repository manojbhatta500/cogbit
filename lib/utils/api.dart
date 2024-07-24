class Apis {
  static String baseApi = 'http://164.52.215.203:8089/procure/v1';
  static String emailLogin = '$baseApi/auth/login';
  static String getModuleList = '$baseApi/module/all';
  static String getMyAppList = '$baseApi/geconf/myapps';

  static String getAllDataHeading = '${baseApi}/ge/listconf/';
}
