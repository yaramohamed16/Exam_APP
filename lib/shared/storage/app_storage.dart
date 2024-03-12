import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppStorage {
  static const _appBoxName = 'appBox';
  static const _token = 'token';
  static final Box _appBox = Hive.box(_appBoxName);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_appBoxName);
  }

  ValueListenable appBoxListener() {
    return _appBox.listenable(keys: [_token]);
  }

  void setToken(String? token) async {
    await _appBox.put(_token, token);
  }

  String? getToken() {
    return _appBox.get(_token);
  }
}
