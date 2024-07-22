import 'package:categories_task/category_feature/data/models/product_stand.dart';
import 'package:flutter/material.dart';
import 'add_to_cart_out_of_stock_button.dart';

class ProductStandItemWidget extends StatelessWidget {
  const ProductStandItemWidget({super.key, required this.product});

  final ProductStandItem product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
            product.image.isEmpty ? Image.network('https://static.vecteezy.com/system/resources/previews/004/999/463/original/shopping-cart-icon-illustration-free-vector.jpg',fit: BoxFit.cover,) : Image.network(fit: BoxFit.cover,
                product.image,
              ),
              product.offerPrice
                  ? Container(padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: const Text(
                        'Hot Offer',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          ),
          Text(
            product.productName,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          product.offerPrice
              ? Column(
                  children: [
                    Text(
                      product.mainPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.priceAfterDiscount,
                      style: const TextStyle(color: Colors.pink),
                    )
                  ],
                )
              : Text(
                  product.mainPrice,
                  style: const TextStyle(
                    color: Colors.pink,
                  ),
                ),
          const Spacer(),
          product.isAvailable
              ? const AddToCartOrOutOfStockButton(
                  backgroundColor: Colors.pink, text: 'Add To Cart')
              : const AddToCartOrOutOfStockButton(
                  backgroundColor: Colors.grey, text: 'Out Of Stock')
        ],
      ),
    );
  }
}
