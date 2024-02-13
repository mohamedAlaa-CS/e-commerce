import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/core/network_info/network_info.dart';
import 'package:e_commerce/features/home/data/data_source/home_local_data_source.dart';
import 'package:e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final HomeLocalDataSorce homeLocalDataSorce;
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepoImpel({
    required this.homeLocalDataSorce,
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (await networkInfo.isConnected() == false) {
      var data = homeLocalDataSorce.getCatecories();
      return right(data);
    }
    try {
      var data = await homeRemoteDataSource.getCAtegories();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BrandsEntity>>> getBrands() async {
    try {
      var data = await homeRemoteDataSource.getBrands();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
