import 'package:e_commerce/features/categores/data/model/sub_category_model.dart';
import 'package:e_commerce/features/categores/data/repos/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(this._categoryRepo) : super(SubCategoryInitial());
  static SubCategoryCubit get(context) => BlocProvider.of(context);
  final CategoryRepo _categoryRepo;
  List<SubCategoryModel> subCategoryList = [];
  Future<void> getSubCategory({required String categoryId}) async {
    emit(SubCategoryLoading());
    var result = await _categoryRepo.getSubCategory(categoryId);
    result.fold((error) {
      emit(SubCategoryFaliure(error.message));
    }, (succes) {
      emit(SubCategorySuccess());
      subCategoryList.addAll(succes);
    });
  }
}
