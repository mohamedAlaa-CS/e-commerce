import 'package:dio/dio.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInj() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  Dio dio = Dio();
  dio.options.baseUrl = AppStrings.baseUrl;
  dio.options.validateStatus = (i) => true;

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
  ));

  getIt.registerSingleton<Dio>(dio);
}
