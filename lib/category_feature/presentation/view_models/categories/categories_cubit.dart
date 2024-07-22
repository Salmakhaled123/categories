import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model.dart';
import '../../../data/repos/categories_repo.dart';
part 'categories_state.dart';
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());
   CategoriesRepo categoriesRepo;
   List<CategoryItem>categoriesItems=[];
  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    var result = await categoriesRepo.getCategories();
    result.fold((failure)
    {
      print(failure.errorMessage);
      emit(CategoriesFailed(errorMessage: failure.errorMessage));
    }, (categories)
    {
      categoriesItems=categories;
      emit(CategoriesSuccess(categoriesList: categories));
    });
  }



}
