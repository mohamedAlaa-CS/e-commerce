import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';

abstract class HomeLocalDataSorce {
  List<CategoryEntity> getCatecories();
  List<BrandsEntity> getBrands();
}

class HomeLocalDataSourceImpel implements HomeLocalDataSorce {
  @override
  List<CategoryEntity> getCatecories() {
    // TODO: implement getCatecories
    throw UnimplementedError();
  }
  
  @override
  List<BrandsEntity> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }
}
