import 'package:e_commerce/features/home/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_category_state.dart';

class HomeCategoryAndBrandsCubit
    extends Cubit<HomeCategoryAndBrandsStatesState> {
  HomeCategoryAndBrandsCubit(this.categoriesUseCase, this.brandsUseCase)
      : super(HomeCategoryAndBrandsInitial());
  final CategoriesUseCase categoriesUseCase;
  final BrandsUseCase brandsUseCase;
  static HomeCategoryAndBrandsCubit get(context) => BlocProvider.of(context);
  List<CategoryEntity> categoriesList = [];

  getCategory() async {
    emit(HomeCategoryLoading());
    var result = await categoriesUseCase.call();
    result.fold((fail) {
      emit(HomeCategoryFailuer(erroeMessage: fail.message));
    }, (categoriesEntity) {
      categoriesList.addAll(categoriesEntity);

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
