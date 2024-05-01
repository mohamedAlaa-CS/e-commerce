import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/Api/api_services.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/categores/data/model/sub_category_model.dart';

import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategory(
      String categoryId) async {
    try {
      var response = await ApiServices.get(
          endPoint: AppStrings.subCategories.replaceAll('id', categoryId));
      List<SubCategoryModel> subCategoryList = [];
      for (var item in response['data']) {
        subCategoryList.add(SubCategoryModel.fromJson(item));
      }
      return right(subCategoryList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
