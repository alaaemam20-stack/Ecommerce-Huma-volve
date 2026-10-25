import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app_huma_volve/features/home/cubit/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/categories_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/home_service.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeService homeService;

  HomeCubit(this.homeService) : super(HomeInitialState());

  List<CategoryModel> categories = [];
  List<ProductModel> products = [];

  int? selectedCategoryId;

  Future<void> loadData() async {
    emit(HomeLoadingCategoryState());

    try {
      categories = await homeService.getAllCategories();

      emit(HomeSuccessCategoryState(categories));

      if (categories.isNotEmpty) {
        selectedCategoryId = categories.first.id;
        await getProducts(selectedCategoryId!);
      }
    } catch (e) {
      emit(HomeErrorCategoryState(e.toString()));
    }
  }

  Future<void> getProducts(int categoryId) async {
    selectedCategoryId = categoryId;

    emit(HomeLoadingProductsState());

    try {
      products = await homeService.getProducts(categoryId);

      emit(HomeSuccessProductsState(products));
    } catch (e) {
      emit(HomeErrorProductsState(e.toString()));
    }
  }
}
