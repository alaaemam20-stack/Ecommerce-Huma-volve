import 'package:ecommerce_app_huma_volve/features/home/data/models/category_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_hive_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheCategory(List<CategoryHiveModel> categories);

  Future<List<CategoryHiveModel>> getCategories();

  Future<void> clearCategories();

  Future<void> cacheProducts(int categoryId, List<ProductHiveModel> products);

  Future<List<ProductHiveModel>> getProducts(int categoryId);

  Future<void> clearProducts(int categoryId);
}
