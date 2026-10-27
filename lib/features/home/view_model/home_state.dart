import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entitiy.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingCategoryState extends HomeStates {}

class HomeSuccessCategoryState extends HomeStates {
  final List<CategoryEntity> categories;

  HomeSuccessCategoryState(this.categories);
}

class HomeErrorCategoryState extends HomeStates {
  final String message;

  HomeErrorCategoryState(this.message);
}

class HomeLoadingProductsState extends HomeStates {}

class HomeSuccessProductsState extends HomeStates {
  final List<ProductEntity> products;

  HomeSuccessProductsState(this.products);
}

class HomeErrorProductsState extends HomeStates {
  final String message;

  HomeErrorProductsState(this.message);
}

class HomeLoadingMoreProductsState extends HomeStates {}

class ProductsLoadingMoreErrorState extends HomeStates {
  final String message;

  ProductsLoadingMoreErrorState({required this.message});
}
