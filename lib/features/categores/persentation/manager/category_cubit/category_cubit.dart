import 'package:e_commerce/features/categores/data/model/sub_category_model.dart';
import 'package:e_commerce/features/categores/data/repos/category_repo.dart';
import 'package:e_commerce/features/home/data/models/categories.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepo) : super(SubCategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);
  int selectIndex = 0;
  Future<void> cahngeSelectIndex(int index) async {
    selectIndex = index;
    emit(ChangeSelectIndex());
  }

  String? categoryTitle;

  final CategoryRepo _categoryRepo;
  List<SubCategoryModel> subCategoryList = [];
  Future<void> getSubCategory() async {
    emit(SubCategoryLoading());
    subCategoryList = [];
    var result =
        await _categoryRepo.getSubCategory(categoryList[selectIndex].id ?? '');
    result.fold((error) {
      emit(SubCategoryFaliure(error.message));
    }, (succes) {
      emit(SubCategorySuccess());
      subCategoryList.addAll(succes);
      categoryTitle = categoryList[selectIndex].name;
    });
  }

  List<CategoriesModel> categoryList = [];
  Future<void> getCategory() async {
    emit(CategoryLoading());

    var result = await _categoryRepo.getCategories();
    result.fold((error) {
      emit(CategoryFaliure(error.message));
    }, (succes) async {
      emit(CategorySuccess());
      categoryList.addAll(succes);
      await getSubCategory();
    });
  }
}
