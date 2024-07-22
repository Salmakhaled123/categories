import 'package:flutter/material.dart';

import '../../../data/models/categories_stands.dart';
class CustomCategoryStandWidget extends StatelessWidget {
  const CustomCategoryStandWidget({
    super.key, required this.categoryStandItem,
  });
  final CategoryStandItem categoryStandItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15,bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.withOpacity(0.25), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Tab(
          text: categoryStandItem.title,
        ),
      ),
    );
  }
}
