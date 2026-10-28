import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final ProductEntity product;

  DetailsSuccess(this.product);
}

class DetailsError extends DetailsState {
  final String message;

  DetailsError(this.message);
}
