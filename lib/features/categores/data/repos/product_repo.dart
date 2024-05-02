import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failuer.dart';
import 'package:e_commerce/features/categores/data/model/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
