class CategoriesStands {
  final List<CategoryStandItem> stands;

  CategoriesStands({required this.stands});

  factory CategoriesStands.fromJson(Map<String, dynamic> json) {
    List<CategoryStandItem> data = [];
    json['data'].map((item) {
      data.add(CategoryStandItem.fromJson(item));
    }).toList();
    return CategoriesStands(stands: data);
  }
}

class CategoryStandItem {
  final int id;
  final String title;

  CategoryStandItem({required this.id, required this.title});

  factory CategoryStandItem.fromJson(Map<String, dynamic> json) {
    return CategoryStandItem(
      id: json['id'],
      title: json['title'],
    );
  }
}
