import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

 abstract class ProductDetailsRepoInterface {


    Future<Either<Failure, ProductEntity>> getProductById(
    int productId,
  );
}
