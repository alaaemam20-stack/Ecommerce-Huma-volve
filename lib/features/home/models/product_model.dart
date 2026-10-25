import 'categories_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final CategoryModel category;
  final List<String> images;
  final String creationAt;
  final String updatedAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      category: CategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      images: List<String>.from(json['images'] as List),
      creationAt: json['creationAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
