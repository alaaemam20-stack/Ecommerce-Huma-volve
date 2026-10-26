import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entitiy.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repo/home_repo.dart';

class GetCategoryUsecase {
  final HomeRepo homeRepo;
  GetCategoryUsecase(this.homeRepo);
 Future<Either<Failure,List<CategoryEntity>>>invoke()=>homeRepo.getCategories();


}