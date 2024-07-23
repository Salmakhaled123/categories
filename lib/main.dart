
import 'package:categories_task/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_feature/data/repos/categories_repo_imp.dart';
import 'category_feature/presentation/view_models/categories/categories_cubit.dart';
import 'category_feature/presentation/view_models/categories_stand/categories_stands_cubit.dart';
import 'category_feature/presentation/views/categories_view.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CategoriesCubit(getIt.get<CategoriesRepoImp>())..getAllCategories()),
      BlocProvider(create: (context)=>CategoriesStandsCubit(getIt.get<CategoriesRepoImp>())),

    ],
      child: const MaterialApp(
        title: 'task',
        debugShowCheckedModeBanner: false,
        home: CategoriesView(),
      ),
    );
  }
}

