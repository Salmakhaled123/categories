

import 'package:categories_task/category_feature/data/models/product_stand.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/api_service.dart';
import '../../../core/constants.dart';
import '../../../core/errors/failure.dart';
import '../models/categories_model.dart';
import '../models/categories_stands.dart';
import 'categories_repo.dart';

class CategoriesRepoImp extends CategoriesRepo{
  final ApiService apiService;

  CategoriesRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<CategoryItem>>> getCategories()async {
    try {
      var result = await apiService.get(Constants.getCategoriesEndPoint);
      var data = CategoriesModel.fromJson(result);
      return right(data.data);
    } catch (e)
    {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryStandItem>>> getCategoryStands(int categoryId)async {
    try {
      var result = await apiService.get('${Constants.getCategoriesStandsEndPoint}$categoryId');
      var data = CategoriesStands.fromJson(result);
      return right(data.stands);
    } catch (e)
    {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductStandItem>>> getProductsStand(String categoryId, String standId) async{
    try {
      var result = await apiService.get('${Constants.getProductStandsEndPoint}$categoryId/$standId/0/10');
      var data = ProductStandModel.fromJson(result);
      return right(data.productsStandList);
    } catch (e)
    {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  }

  
