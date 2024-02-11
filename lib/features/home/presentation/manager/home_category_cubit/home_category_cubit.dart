import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  HomeCategoryCubit(this.categoriesUseCase) : super(HomeCategoryInitial());
  final CategoriesUseCase categoriesUseCase;
  static HomeCategoryCubit get(context) => BlocProvider.of(context);
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
}
