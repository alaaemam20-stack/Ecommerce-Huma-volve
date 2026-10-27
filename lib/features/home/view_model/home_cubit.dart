import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_huma_volve/features/home/view_model/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_category_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_product_usecase.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetCategoryUsecase getCategoriesUseCase;
  final GetProductUsecase getProductsUseCase;
  final int limit = 10;
  int offset = 0;
  bool isLoadingMore = false;
  bool hasMoreProducts = true;
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
        if (categoryList.isEmpty) {
          emit(HomeErrorCategoryState('No categories found'));
          return;
        }

        isSelectedCategory = categoryList.first.id;

        emit(HomeSuccessCategoryState(categoryList));

        await getProductsByCategories(categoryList.first.id);
      },
    );
  }

Future<void> getProductsByCategories(int categoryId) async {
  isSelectedCategory = categoryId;

  _products.clear();
  offset = 0;
  hasMoreProducts = true;

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
      hasMoreProducts = productList.length >= limit;

      emit(HomeSuccessProductsState(List.from(_products)));
    },
  );
}
  Future<void> loadMoreProducts() async {
    if (isLoadingMore || !hasMoreProducts) {
      return;
    }

    isLoadingMore = true;
    emit(HomeLoadingMoreProductsState());

    final productResult = await getProductsUseCase.invoke(
      isSelectedCategory!,
      limit: limit,
      offset: offset,
    );

    productResult.fold(
      (failure) {
        emit(ProductsLoadingMoreErrorState(message: failure.failureMessage));
      },
      (productList) {
        _products.addAll(productList);
        offset += productList.length;
        if (productList.length < limit) {
          hasMoreProducts = false;
        }
        emit(HomeSuccessProductsState(List.from(_products)));
      },
    );

    isLoadingMore = false;
  }
}
