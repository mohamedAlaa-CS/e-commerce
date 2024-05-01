import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/categores/data/model/sub_category_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(
      String categoryId);
}
