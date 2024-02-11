import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_category_state.dart';

class HomeCategoryCubitAndBrands
    extends Cubit<HomeCategoryAndBrandsStatesState> {
  HomeCategoryCubitAndBrands(this.categoriesUseCase, this.brandsUseCase)
      : super(HomeCategoryAndBrandsInitial());
  final CategoriesUseCase categoriesUseCase;
  final BrandsUseCase brandsUseCase;
  static HomeCategoryCubitAndBrands get(context) => BlocProvider.of(context);
  List<CategoryEntity> categoriesList = [];
  List<CategoryEntity> categoriesList_1 = [];
  List<CategoryEntity> categoriesList_2 = [];

  getCategory() async {
    emit(HomeCategoryLoading());
    var result = await categoriesUseCase.call();
    result.fold((fail) {
      emit(HomeCategoryFailuer(erroeMessage: fail.message));
    }, (categoriesEntity) {
      categoriesList.addAll(categoriesEntity);
      var listLenght = categoriesList.length;
      categoriesList_1 = categoriesList.sublist(0, (listLenght / 2).round());
      categoriesList_2 = categoriesList.sublist(
          (listLenght / 2).round(), categoriesList.length);
      emit(HomeCategorySuccess());
    });
  }

  List<BrandsEntity> brandsListData = [];

  getBrands() async {
    emit(HomeBrandsLoading());
    var result = await brandsUseCase.call();
    result.fold((fail) {
      emit(HomeBrandsFailuer(errorMessage: fail.message));
    }, (brandsList) {
      brandsListData.addAll(brandsList);
      emit(HomeBrandsSuccess());
    });
  }
}
