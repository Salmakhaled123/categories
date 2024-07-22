

import 'package:categories_task/category_feature/data/models/product_stand.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../models/categories_model.dart';
import '../models/categories_stands.dart';

abstract class CategoriesRepo{
  Future<Either<Failure,List<CategoryItem>>>getCategories();
  Future<Either<Failure,List<CategoryStandItem>>>getCategoryStands(int categoryId);
  Future<Either<Failure,List<ProductStandItem>>>getProductsStand(String categoryId,String standId);

}