import 'package:categories_task/category_feature/data/repos/categories_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt=GetIt.instance;
void setupDependencyInjection()
{
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<CategoriesRepoImp>(
    CategoriesRepoImp(
         apiService: getIt.get<ApiService>()
    ),
  );}