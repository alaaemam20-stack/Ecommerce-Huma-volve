import 'home_category_entitiy.dart';

class ProductEntity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  CategoryEntity category;
  List<String> images;
  String creationAt;
  String updatedAt;

  ProductEntity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.price = 0,
    this.description = '',
    CategoryEntity? category,
    this.images = const [],
    this.creationAt = '',
    this.updatedAt = '',
  }) : category = category ?? CategoryEntity();
}
