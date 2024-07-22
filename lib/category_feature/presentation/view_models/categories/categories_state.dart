part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final List<CategoryItem> categoriesList;
  CategoriesSuccess({required this.categoriesList});
}
final class CategoriesFailed extends CategoriesState {
  final String errorMessage;

  CategoriesFailed({required this.errorMessage});

}

