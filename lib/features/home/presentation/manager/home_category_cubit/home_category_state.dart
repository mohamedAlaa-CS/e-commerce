part of 'home_category_cubit.dart';

@immutable
sealed class HomeCategoryAndBrandsStatesState {}

final class HomeCategoryAndBrandsInitial
    extends HomeCategoryAndBrandsStatesState {}

final class HomeCategoryLoading extends HomeCategoryAndBrandsStatesState {}

final class HomeCategorySuccess extends HomeCategoryAndBrandsStatesState {}

final class HomeCategoryFailuer extends HomeCategoryAndBrandsStatesState {
  final String erroeMessage;

  HomeCategoryFailuer({required this.erroeMessage});
}

final class HomeBrandsLoading extends HomeCategoryAndBrandsStatesState {}

final class HomeBrandsSuccess extends HomeCategoryAndBrandsStatesState {}

final class HomeBrandsFailuer extends HomeCategoryAndBrandsStatesState {
  final String errorMessage;

  HomeBrandsFailuer({required this.errorMessage});
}
