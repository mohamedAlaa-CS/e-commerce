import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
