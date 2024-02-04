import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserModel>> userLogin({
    required String email,
    required String passWord,
  });
  Future<Either<Failuer, UserModel>> userSignup({
    required String name,
    required int phone,
    required String email,
    required String poassWord,
  });
}
