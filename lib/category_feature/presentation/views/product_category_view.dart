import 'package:categories_task/category_feature/presentation/views/widgets/bottom_navigation_bar_widget.dart';
import 'package:categories_task/category_feature/presentation/views/widgets/custom_category_stand_widget.dart';
import 'package:categories_task/category_feature/presentation/views/widgets/empty_list_widget.dart';
import 'package:categories_task/category_feature/presentation/views/widgets/products_stand_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/categories/categories_cubit.dart';
import '../view_models/categories_stand/categories_stands_cubit.dart';

class ProductsCategoryView extends StatefulWidget {
  final int currentPosition;
  const ProductsCategoryView({
    super.key,
    required this.currentPosition,
  });

  @override
  State<ProductsCategoryView> createState() => _ProductsCategoryViewState();
}

class _ProductsCategoryViewState extends State<ProductsCategoryView>
    with SingleTickerProviderStateMixin {
 late TabController subTabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesStandsCubit>(context).getAllCategoriesStands(
      int.parse(
        BlocProvider.of<CategoriesCubit>(context)
            .categoriesItems[widget.currentPosition]
            .id,
      ),
    );
  }

  void _handleTabSelection() async {
    if (subTabController.indexIsChanging) {
      await BlocProvider.of<CategoriesStandsCubit>(context).getProductsStands(
        categoryId: BlocProvider.of<CategoriesCubit>(context)
            .categoriesItems[widget.currentPosition]
            .id,
        standId: BlocProvider.of<CategoriesStandsCubit>(context)
            .stands[subTabController.index]
            .id
            .toString(),
      );
    }
  }

  @override
  void dispose() {
    subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesStandsCubit, CategoriesStandsState>(
      listener: (context, state) {
        if (state is CategoriesStandsSuccess) {
          BlocProvider.of<CategoriesStandsCubit>(context).getProductsStands(
            categoryId: context.read<CategoriesCubit>().categoriesItems[widget.currentPosition].id,
            standId: context.read<CategoriesStandsCubit>().stands.first.id.toString(),
          );
          subTabController = TabController(
            length: BlocProvider.of<CategoriesStandsCubit>(context).stands.length,
            vsync: this,
          );
          subTabController.addListener(_handleTabSelection);
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: widget.currentPosition,
          length: BlocProvider.of<CategoriesCubit>(context).categoriesItems.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink,
              bottom: TabBar(
                isScrollable: true,
                tabs: BlocProvider.of<CategoriesCubit>(context)
                    .categoriesItems
                    .map((category) {
                  return Tab(
                    text: category.name,
                  );
                }).toList(),
              ),
            ),
            body: state is CategoriesStandsLoading  ? const Center(child: CircularProgressIndicator(),):
            Column(
              children: [
                TabBar(
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  controller: subTabController,
                  isScrollable: true,
                  indicatorColor: Colors.purple,
                  indicatorWeight: 2,
                  tabs: context.read<CategoriesStandsCubit>().stands.map((category) {
                    return CustomCategoryStandWidget(
                      categoryStandItem: category,
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: subTabController,
                    children: List.generate(
                      context.read<CategoriesStandsCubit>().stands.length,
                          (index)
                      {
                        if(context.read<CategoriesStandsCubit>().productsList.isEmpty && state is ProductsStandsSuccess)
                          {
                            return const EmptyListWidget();
                          }
                        else if(state is ProductsStandsLoading)
                          {
                            return const Center(child: CircularProgressIndicator(),);
                          }
                        else
                          {
                            return ProductsStandGridView(
                              products: context.read<CategoriesStandsCubit>().productsList,
                            );
                          }
                      },
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomNavigationBarWidget(),
          ),
        );
      },
    );
  }
}
