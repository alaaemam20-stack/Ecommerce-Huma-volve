import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repo/home_repo.dart';

class GetProductUsecase {
  final HomeRepo homeRepo;
  GetProductUsecase(this.homeRepo);
 Future<Either<Failure,List<ProductEntity>>>invoke(int categoryId)=>homeRepo.getProducts(categoryId);

}