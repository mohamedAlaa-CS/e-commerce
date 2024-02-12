import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSorce {
  List<CategoryEntity> getCatecories();
  List<BrandsEntity> getBrands();
}

class HomeLocalDataSourceImpel implements HomeLocalDataSorce {
  @override
  List<CategoryEntity> getCatecories() {
    var box = Hive.box<CategoryEntity>(AppStrings.categoryBox);
    return box.values.toList();
  }

  @override
  List<BrandsEntity> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }
}
