import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/Api/api_services.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpel extends AuthRepo {
  @override
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String passWord,
  }) async {
    try {
      Map<String, dynamic> data =
          await ApiServices.post(endPoint: AppStrings.login, data: {
        'email': email,
        'password': passWord,
      });

      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> userSignup({
    required String name,
    required String phone,
    required String email,
    required String poassWord,
    required String rePoassWord,
  }) async {
    try {
      Map<String, dynamic> data =
          await ApiServices.post(endPoint: AppStrings.sigup, data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': poassWord,
        'rePassword': rePoassWord
      });

      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
