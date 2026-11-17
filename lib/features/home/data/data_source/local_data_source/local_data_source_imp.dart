
import 'package:ecommerce_app_huma_volve/core/error/exception.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_cached_model.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp implements HomeLocalDataSource {
  final Box<CategoryHiveModel> categoryBox;
  final Box<ProductCachedModel> productBox;

  HomeLocalDataSourceImp({
    required this.categoryBox,
    required this.productBox,
  });

  @override
  Future<void> cacheCategory(
    List<CategoryHiveModel> categories,
  ) async {
    await categoryBox.clear();
    await categoryBox.addAll(categories);
  }

  @override
  Future<List<CategoryHiveModel>> getCategories() async {
    if (categoryBox.isEmpty) {
      throw CachedExceptions();
    }

    return categoryBox.values.toList();
  }

  @override
  Future<void> clearCategories() async {
    await categoryBox.clear();
  }

  @override
  Future<void> cacheProducts(
    int categoryId,
    List<ProductHiveModel> products,
  ) async {
    await productBox.put(
      categoryId,
      ProductCachedModel(products),
    );
  }

  @override
  Future<List<ProductHiveModel>> getProducts(int categoryId) async {
    final cached = productBox.get(categoryId);

    if (cached == null) {
      throw CachedExceptions();
    }

    return cached.products;
  }

  @override
  Future<void> clearProducts(int categoryId) async {
    await productBox.delete(categoryId);
  }
}
