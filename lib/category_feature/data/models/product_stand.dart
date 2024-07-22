class ProductStandModel {
  final List<ProductStandItem> productsStandList;

  ProductStandModel({required this.productsStandList});
  factory ProductStandModel.fromJson(Map<String,dynamic>json)
  {
    List<ProductStandItem>products = [];
    json['data'].map((item) {
      products.add(ProductStandItem.fromJson(item));
    }).toList();
    return ProductStandModel(productsStandList:products );
  }
}

class ProductStandItem {
  final String id;
  final bool isAvailable;
  final String productName;
  final String image;
  final String mainPrice;
  final String priceAfterDiscount;
  final int hasOffer;
  final bool offerPrice;

  ProductStandItem({
    required this.id,
    required this.isAvailable,
    required this.productName,
    required this.image,
    required this.mainPrice,
    required this.priceAfterDiscount,
    required this.hasOffer,
    required this.offerPrice,
  });

  factory ProductStandItem.fromJson(Map<String, dynamic> json) {
    return ProductStandItem(
      id: json['id'],
      isAvailable: json['is_available'],
      productName: json['products_name'],
      image: json['image'] ?? 'https://static.vecteezy.com/system/resources/previews/004/999/463/original/shopping-cart-icon-illustration-free-vector.jpg',
      mainPrice: json['MainPrice'],
      priceAfterDiscount: json['priceAfterDiscount'],
      hasOffer: json['has_offer'],
      offerPrice: json['offer_price'],
    );
  }
}
