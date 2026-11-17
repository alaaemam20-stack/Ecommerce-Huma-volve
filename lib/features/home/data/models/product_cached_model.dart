import 'package:hive/hive.dart';
import 'product_hive_model.dart';

//part 'product_cached_model.g.dart';

@HiveType(typeId: 1)
class ProductCachedModel {
  @HiveField(0)
  final List<ProductHiveModel> products;

  ProductCachedModel(this.products);
}