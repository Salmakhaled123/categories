part of 'categories_stands_cubit.dart';

@immutable
sealed class CategoriesStandsState {}

final class CategoriesStandsInitial extends CategoriesStandsState {}
final class CategoriesStandsLoading extends CategoriesStandsState {}
final class CategoriesStandsSuccess extends CategoriesStandsState {
  final List<CategoryStandItem> items;
  CategoriesStandsSuccess({required this.items});
}
final class CategoriesStandsFailed extends CategoriesStandsState {
  final String errorMessage;

  CategoriesStandsFailed({required this.errorMessage});

}
final class ProductsStandsLoading extends CategoriesStandsState {}
final class ProductsStandsSuccess extends CategoriesStandsState {
  final List<ProductStandItem> productsStands;
  ProductsStandsSuccess({required this.productsStands});
}
final class ProductsStandsFailed extends CategoriesStandsState {
  final String errorMessage;

  ProductsStandsFailed({required this.errorMessage});

}