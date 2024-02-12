import 'package:e_commerce/core/Api/api_services.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/home/data/models/brands.model.dart';
import 'package:e_commerce/features/home/data/models/categories.model.dart';
import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getCAtegories();
  Future<List<BrandsEntity>> getBrands();
}

class HomeRemoteDataSourceImpel implements HomeRemoteDataSource {
  @override
  Future<List<CategoryEntity>> getCAtegories() async {
    var response = await ApiServices.get(endPoint: AppStrings.categories);
    List<CategoryEntity> categoriesList = [];

    for (var item in response['data']) {
      categoriesList.add(CategoriesModel.fromJson(item));
    }
    var box = Hive.box<CategoryEntity>(AppStrings.categoryBox);
    box.addAll(categoriesList);
    return categoriesList;
  }

  @override
  Future<List<BrandsEntity>> getBrands() async {
    var response = await ApiServices.get(endPoint: AppStrings.brands);
    List<BrandsEntity> brandsList = [];

    for (var item in response['data']) {
      brandsList.add(BrandsModel.fromJson(item));
    }
    return brandsList;
  }
}
