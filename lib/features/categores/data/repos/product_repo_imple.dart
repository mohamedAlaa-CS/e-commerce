import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/Api/api_services.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/categores/data/model/product_model/product_model.dart';
import 'package:e_commerce/features/categores/data/repos/product_repo.dart';

class ProductRepoImple implements ProductRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var response = await ApiServices.get(endPoint: AppStrings.allProducts);
      List<ProductModel> productsList = [];
      for (var item in response['data']) {
        productsList.add(item);
      }
      return right(productsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
