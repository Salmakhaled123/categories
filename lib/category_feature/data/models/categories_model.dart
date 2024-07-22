class CategoriesModel {
  final List<CategoryItem> data;

  CategoriesModel({required this.data});
  factory CategoriesModel.fromJson(dynamic json)
  {
    List<CategoryItem>categoriesItemsList = [];
    json['data'].map((item) {
      categoriesItemsList.add(CategoryItem.fromJson(item));
    }).toList();
    return CategoriesModel(data: categoriesItemsList);
  }
}

class CategoryItem {
  final String name;
  final String image;
  final String id;

 const  CategoryItem({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['name'],
      image: json['image'] ?? '',
      id: json['id'],
    );
  }
}
