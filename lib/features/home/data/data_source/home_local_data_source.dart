import 'package:e_commerce/core/helper/functions/change_list_model_to_list_string.dart';
import 'package:e_commerce/core/helper/functions/change_list_string_to_list_model.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/helper/utilities/local_data.dart';
import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/injections.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSorce {
  List<CategoryEntity> getCatecories();
  List<BrandsEntity> getBrands();
  Future<void> cachCategory(List<CategoryEntity> categoryList);
  Future<void> cachBrands(List<BrandsEntity> brandsList);
}

class HomeLocalDataSourceImpel implements HomeLocalDataSorce {
  @override
  List<CategoryEntity> getCatecories() {
    var box = Hive.box<CategoryEntity>(AppStrings.categoryBox);
    return box.values.toList();
  }

  @override
  List<BrandsEntity> getBrands() {
    //! get brand from local data with sheardPrefransce
    final jsonString =
        getIt.get<SharedPreferences>().getStringList(AppStrings.brandBox);
    return changeListStringToListModel(jsonString);
  }

  @override
  Future<void> cachCategory(List<CategoryEntity> categoryList) async {
    var box = Hive.box<CategoryEntity>(AppStrings.categoryBox);

    if (box.values.toList().isEmpty) {
      //! save data
      await box.addAll(categoryList);
    } else {
      //! delete value in box
      await box.deleteAll(box.keys);
      //! save data
      await box.addAll(categoryList);
    }
  }

  @override
  Future<void> cachBrands(List<BrandsEntity> brandsList) async {
    // //! save brand in local data with sheardPrefransce
    var data = LocalData.getListString(AppStrings.brandBox);
    if (data == null) {
      LocalData.saveListString(
        AppStrings.brandBox,
        changeListModelToListString(brandsList: brandsList),
      );
    } else {
      data.clear();
      LocalData.saveListString(
        AppStrings.brandBox,
        changeListModelToListString(brandsList: brandsList),
      );
    }
  }
}
