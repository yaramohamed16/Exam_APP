import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../storage/app_storage.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://coursafer.innoeg.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'ApiKey': 'test',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
      'ApiKey': 'test',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<bool> signIn(String email, String password) async {
    var dio = Dio();
    var url = 'https://coursafer.innoeg.com/api/auth/login';
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
