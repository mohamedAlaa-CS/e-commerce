part of 'sub_category_cubit.dart';

@immutable
sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class SubCategoryLoading extends SubCategoryState {}

final class SubCategorySuccess extends SubCategoryState {}

final class SubCategoryFaliure extends SubCategoryState {
  final String error;
  SubCategoryFaliure(this.error);
}
