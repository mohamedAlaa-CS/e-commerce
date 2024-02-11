import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';

abstract class HomeLocalDataSorce {
  List<CategoryEntity> getCatecories();
}

class HomeLocalDataSourceImpel implements HomeLocalDataSorce {
  @override
  List<CategoryEntity> getCatecories() {
    // TODO: implement getCatecories
    throw UnimplementedError();
  }
}
