import 'package:hive/hive.dart';
import 'category_hive_model.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: 2)
class ProductHiveModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String slug;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final CategoryHiveModel? category;

  @HiveField(6)
  final List<String> images;

  @HiveField(7)
  final String creationAt;

  @HiveField(8)
  final String updatedAt;

  ProductHiveModel({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.price = 0,
    this.description = '',
    this.category,
    this.images = const [],
    this.creationAt = '',
    this.updatedAt = '',
  });
}