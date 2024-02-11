part of 'home_category_cubit.dart';

@immutable
sealed class HomeCategoryState {}

final class HomeCategoryInitial extends HomeCategoryState {}

final class HomeCategoryLoading extends HomeCategoryState {}

final class HomeCategorySuccess extends HomeCategoryState {}

final class HomeCategoryFailuer extends HomeCategoryState {
  final String erroeMessage;

  HomeCategoryFailuer({required this.erroeMessage});
}
