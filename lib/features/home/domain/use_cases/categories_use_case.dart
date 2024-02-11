import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/repos/home_repo.dart';

class CategoriesUseCase {
  final HomeRepo _homeRepo;

  CategoriesUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await _homeRepo.getCategories();
  }
}
