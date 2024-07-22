
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_feature/data/repos/categories_repo_imp.dart';
import 'category_feature/presentation/view_models/categories/categories_cubit.dart';
import 'category_feature/presentation/view_models/categories_stand/categories_stands_cubit.dart';
import 'category_feature/presentation/views/categories_view.dart';
import 'core/api_service.dart';
import 'core/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CategoriesCubit(CategoriesRepoImp(apiService: ApiService(dio: Dio())))..getAllCategories()),
      BlocProvider(create: (context)=>CategoriesStandsCubit(CategoriesRepoImp(apiService: ApiService(dio: Dio())))),

    ],
      child: const MaterialApp(
        title: 'task',
        debugShowCheckedModeBanner: false,
        home: CategoriesView(),
      ),
    );
  }
}

