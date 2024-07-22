import 'package:bloc/bloc.dart';
import 'package:categories_task/category_feature/data/models/product_stand.dart';
import 'package:meta/meta.dart';

import '../../../data/models/categories_stands.dart';
import '../../../data/repos/categories_repo.dart';

part 'categories_stands_state.dart';

class CategoriesStandsCubit extends Cubit<CategoriesStandsState> {
  CategoriesStandsCubit(this.categoriesRepo) : super(CategoriesStandsInitial());
  List<CategoryStandItem>stands=[];
  CategoriesRepo categoriesRepo;
List<ProductStandItem>productsList=[];
  Future<void> getAllCategoriesStands(int categoryId) async {
    emit(CategoriesStandsLoading());
    var result = await categoriesRepo.getCategoryStands(categoryId);
    result.fold((failure)
    {
      print(failure.errorMessage);
      emit(CategoriesStandsFailed(errorMessage: failure.errorMessage));
    }, (category)
    {
      stands=category;
      emit(CategoriesStandsSuccess(items: stands));
    });
  }
  Future<void> getProductsStands({required String categoryId,required String standId}) async {
    emit(ProductsStandsLoading());
    var result = await categoriesRepo.getProductsStand(categoryId,standId);
    result.fold((failure)
    {
      print(failure.errorMessage);
      emit(ProductsStandsFailed(errorMessage: failure.errorMessage));
    }, (product)
    {
    productsList=product;
    print(productsList.length);
      emit(ProductsStandsSuccess(productsStands: product));
    });
  }

}
