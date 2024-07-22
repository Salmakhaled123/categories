import 'package:categories_task/category_feature/presentation/views/widgets/product_stand_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/product_stand.dart';

class ProductsStandGridView extends StatelessWidget {
  const ProductsStandGridView({
    super.key,
    required this.products,
  });

  final List<ProductStandItem> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 7,
          crossAxisCount: 3,
          // Number of items per row
          crossAxisSpacing: 3,
          // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
        ),
        itemBuilder: (context, index) =>
            ProductStandItemWidget(product: products[index]));
  }
}
