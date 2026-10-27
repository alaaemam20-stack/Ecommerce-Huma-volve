import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entitiy.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<CategoryEntity>>>getCategories();
 Future<Either<Failure,List<ProductEntity>>>getProducts(int categoryId,{required int limit,required int offset});


}