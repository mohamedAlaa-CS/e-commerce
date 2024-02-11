import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  HomeCategoryCubit(this.categoriesUseCase) : super(HomeCategoryInitial());
  final CategoriesUseCase categoriesUseCase;
  HomeCategoryCubit get(context) => BlocProvider.of(context);
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
}
