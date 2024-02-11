import 'package:e_commerce/core/Api/api_services.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/home/data/models/categories.model.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getCAtegories();
}

class HomeRemoteDataSourceImpel implements HomeRemoteDataSource {
  @override
  Future<List<CategoryEntity>> getCAtegories() async {
    var response = await ApiServices.get(endPoint: AppStrings.categories);
    List<CategoryEntity> categoriesList = [];

    for (var item in response['data']) {
      categoriesList.add(CategoriesModel.fromJson(item));
    }
    return categoriesList;
  }
}
