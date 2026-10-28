import 'package:ecommerce_app_huma_volve/features/details/domain/use_case/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_states.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  DetailsCubit(this.getProductDetailsUseCase) : super(DetailsInitial());

  Future<void> getProductDetails(int productId) async {
    emit(DetailsLoading());

    final result = await getProductDetailsUseCase(productId);

    result.fold(
      (failure) {
        emit(DetailsError(failure.failureMessage));
      },
      (product) {
        emit(DetailsSuccess(product));
      },
    );
  }
}
