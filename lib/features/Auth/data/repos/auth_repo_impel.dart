import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpel extends AuthRepo{
  @override
  Future<Either<Failure, UserModel>> userLogin({required String email, required String passWord}) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> userSignup({required String name, required int phone, required String email, required String poassWord}) {
    // TODO: implement userSignup
    throw UnimplementedError();
  }
}