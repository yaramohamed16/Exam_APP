import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app_storage.dart';

class ApiService {
  static Future<bool> signIn(String email, String password) async {
    var dio = Dio();
    var url = 'https://api.engineering-tracks.com/api/auth/login';
    var body = {
      'email': email,
      'password': password,
      'udid': 'HUAWEILYA-L29',
      'lang': 'ar',
    };

    try {
      var response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        // print("fatma${response.data['data']['access_token']}");
        GetIt.instance
            .get<AppStorage>()
            .setToken(response.data['data']['access_token']);
        return true; // Login successful
      } else {
        return false; // Login failed
      }
    } catch (e) {
      return false; // Login failed due to an error
    }
  }
}
