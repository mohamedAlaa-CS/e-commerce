part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class SubCategoryInitial extends CategoryState {}

final class SubCategoryLoading extends CategoryState {}

final class SubCategorySuccess extends CategoryState {}

final class SubCategoryFaliure extends CategoryState {
  final String error;
  SubCategoryFaliure(this.error);
}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {}

final class CategoryFaliure extends CategoryState {
  final String error;
  CategoryFaliure(this.error);
}
 class ChangeSelectIndex extends CategoryState {

}
