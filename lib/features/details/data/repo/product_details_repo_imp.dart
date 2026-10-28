import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_data_source_interface.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/repo/product_details_repo_interface.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

class ProductDetailsRepoImp implements ProductDetailsRepoInterface {
  final DetailsDataSourceInterface detailsDataSourceInterface;

  ProductDetailsRepoImp(this.detailsDataSourceInterface);

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int productId) async {
    try {
      final product = await detailsDataSourceInterface.getProductById(
        productId,
      );
      return Right(product);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
