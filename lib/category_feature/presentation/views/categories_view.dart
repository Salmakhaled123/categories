import 'package:categories_task/category_feature/presentation/views/product_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/categories/categories_cubit.dart';
import '../view_models/categories_stand/categories_stands_cubit.dart';


class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.red,
            )),
        title: const Text(
          'All Categories',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.categoriesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5 / 6,
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 2.0, // Spacing between columns
                mainAxisSpacing: 1.0, // Spacing between rows
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: ()async{
                await BlocProvider.of<CategoriesStandsCubit>(context).getAllCategoriesStands(int.parse(state.categoriesList[index].id));
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsCategoryView( currentPosition: index)));

                },
                child: Column(
                  children: [
                         Image.network(
                            state.categoriesList[index].image,
                          )
                  ],
                ),
              ),
            );
          } else if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesFailed) {
            return Text(state.errorMessage);
          }
          return const SizedBox.shrink();
        },


      ),
    );
  }
}
