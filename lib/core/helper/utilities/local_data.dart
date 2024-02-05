import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static saveString(String key, String value) {
    getIt.get<SharedPreferences>().setString(key, value);
  }

  static getString(String key) {
    getIt.get<SharedPreferences>().getString(key);
  }

  static saveToken(String value) {
    getIt.get<SharedPreferences>().setString(AppStrings.token, value);
  }

//! get token
  static String? get token {
    String? printToken =
        getIt.get<SharedPreferences>().getString(AppStrings.token);
    return printToken;
  }
}
