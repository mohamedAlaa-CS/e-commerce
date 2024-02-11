import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';

class BrandsUseCase {
  final HomeRepo homeRepo;

  BrandsUseCase({required this.homeRepo});

  Future<Either<Failure, List<BrandsEntity>>> call() async {
    return await homeRepo.getBrands();
  }
}
