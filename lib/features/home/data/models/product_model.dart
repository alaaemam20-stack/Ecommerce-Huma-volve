
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

import 'categories_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.description,
    super.category,
    super.images,
    super.creationAt,
    super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final categoryJson = json['category'];
    final imagesJson = json['images'];

    return ProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      category: categoryJson is Map<String, dynamic>
          ? CategoryModel.fromJson(categoryJson)
          : CategoryModel(),
      images: imagesJson is List
          ? imagesJson.whereType<String>().toList()
          : [],
      creationAt: json['creationAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );
  }
}
