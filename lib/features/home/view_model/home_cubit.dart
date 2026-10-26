import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_huma_volve/features/home/view_model/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_category_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_case/get_product_usecase.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetCategoryUsecase getCategoriesUseCase;
  final GetProductUsecase getProductsUseCase;

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
    emit(HomeLoadingProductsState());

    final productResult = await getProductsUseCase.invoke(categoryId);

    productResult.fold(
      (failure) {
        emit(HomeErrorProductsState(failure.failureMessage));
      },
      (productList) {
        emit(HomeSuccessProductsState(productList));
      },
    );
  }
}
