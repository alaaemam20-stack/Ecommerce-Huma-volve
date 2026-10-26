import 'package:ecommerce_app_huma_volve/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingCategoryState extends HomeStates {}

class HomeSuccessCategoryState extends HomeStates {
  final List<CategoryModel> categories;

  HomeSuccessCategoryState(this.categories);
}

class HomeErrorCategoryState extends HomeStates {
  final String message;

  HomeErrorCategoryState(this.message);
}

class HomeLoadingProductsState extends HomeStates {}

class HomeSuccessProductsState extends HomeStates {
  final List<ProductModel> products;

  HomeSuccessProductsState(this.products);
}

class HomeErrorProductsState extends HomeStates {
  final String message;

  HomeErrorProductsState(this.message);
}
