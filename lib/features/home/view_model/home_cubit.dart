import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_huma_volve/features/home/view_model/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_category_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_product_usecase.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetCategoryUsecase getCategoriesUseCase;
  final GetProductUsecase getProductsUseCase;
  final int limit = 10; // Number of products to fetch per request
  int offset = 0; // Offset for pagination
  bool isLoadingMore = false; // Flag to prevent multiple simultaneous requests
  bool hasMoreProducts =
      true; // Flag to indicate if there are more products to load
  int? isSelectedCategory;
  final List<ProductEntity> _products = [];

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getProductsUseCase,
  }) : super(HomeInitialState());

  Future<void> loadData() async {
    emit(HomeLoadingCategoryState());

    final categoryResult = await getCategoriesUseCase.invoke();

    await categoryResult.fold(
      (failure) async {
        emit(HomeErrorCategoryState(failure.failureMessage));
      },
      (categoryList) async {
        emit(HomeSuccessCategoryState(categoryList));

        // Stop if there are no categories.
        if (categoryList.isEmpty) {
          return;
        }

        // Get products for the first category.
        final categoryId = categoryList.first.id;

        await getProductsByCategories(categoryId);
      },
    );
  }

  Future<void> getProductsByCategories(int categoryId) async {
    _products.clear();
    offset = 0;
    hasMoreProducts = true; // Reset the flag for more products
    emit(HomeLoadingProductsState());

    final productResult = await getProductsUseCase.invoke(
      categoryId,
      limit: limit,
      offset: offset,
    );

    productResult.fold(
      (failure) {
        emit(HomeErrorProductsState(failure.failureMessage));
      },
      (productList) {
        _products.addAll(productList);
        offset = productList.length;
        if (productList.length < limit) {
          hasMoreProducts = false;
           emit(HomeSuccessProductsState(List.from(_products)));
        }

       
      },
    );
  }
  Future<void> loadMoreProducts(int categoryId) async {
    if (isLoadingMore || !hasMoreProducts) {
      return; // Prevent multiple simultaneous requests or if no more products
    }

    isLoadingMore = true;
    emit(HomeLoadingMoreProductsState());

    final productResult = await getProductsUseCase.invoke(
      categoryId,
      limit: limit,
      offset: offset,
    );

    productResult.fold(
      (failure) {
        emit(productsLodingMoreErrorState(message: failure.failureMessage));
      },
      (productList) {
        _products.addAll(productList);
        offset += productList.length;
        if (productList.length < limit) {
          hasMoreProducts = false; // No more products to load
        }
        emit(HomeSuccessProductsState(List.from(_products)));
      },
    );

    isLoadingMore = false;
  }
}
