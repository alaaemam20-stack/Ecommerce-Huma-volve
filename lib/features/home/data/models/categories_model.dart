import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entitiy.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({super.id, super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );
  }
}
