import 'product_model.dart';
import 'product_hive_model.dart';
import 'category_hive_model.dart';
import '../../domain/entity/home_product_entity.dart';
import '../../domain/entity/home_category_entitiy.dart';

ProductHiveModel toHiveModel(ProductModel product) {
  return ProductHiveModel(
    id: product.id,
    title: product.title,
    slug: product.slug,
    price: product.price,
    description: product.description,
    category: CategoryHiveModel(
      id: product.category.id,
      name: product.category.name,
    ),
    images: product.images,
    creationAt: product.creationAt,
    updatedAt: product.updatedAt,
  );
}

ProductEntity toEntity(ProductHiveModel product) {
  return ProductEntity(
    id: product.id,
    title: product.title,
    slug: product.slug,
    price: product.price,
    description: product.description,
    category: CategoryEntity(
      id: product.category?.id ?? 0,
      name: product.category?.name ?? "",
    ),
    images: product.images,
    creationAt: product.creationAt,
    updatedAt: product.updatedAt,
  );
}
