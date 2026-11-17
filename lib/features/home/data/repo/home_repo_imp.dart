
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/error/exception.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';

import 'package:ecommerce_app_huma_volve/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';

import 'package:ecommerce_app_huma_volve/features/home/data/models/category_hive_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_hive_mapper.dart';

import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entitiy.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      // 1. Get categories from API
      final categories = await homeRemoteDataSource.getAllCategories();

      // 2. Convert CategoryModel to CategoryHiveModel
      final cachedCategories = categories
          .map(
            (category) => CategoryHiveModel(
              id: category.id,
              name: category.name,
            ),
          )
          .toList();

      // 3. Save categories in Hive
      await homeLocalDataSource.cacheCategory(cachedCategories);

      // 4. Return API data
      return Right(categories);
    } on ServerException catch (e) {
      try {
        // 5. Get categories from Hive if API fails
        final response = await homeLocalDataSource.getCategories();

        // 6. Convert CategoryHiveModel to CategoryEntity
        final categories = response
            .map(
              (category) => CategoryEntity(
                id: category.id,
                name: category.name,
              ),
            )
            .toList();

        return Right(categories);
      } on CachedExceptions catch (cacheError) {
        return Left(ErrorHandler.handle(cacheError));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    int categoryId, {
    required int limit,
    required int offset,
  }) async {
    try {
      // 1. Get products from API
      final products = await homeRemoteDataSource.getProducts(
        categoryId,
        limit: limit,
        offset: offset,
      );

      // 2. Convert ProductModel to ProductHiveModel
      final cachedProducts = products
          .map((product) => toHiveModel(product))
          .toList();

      // 3. Save products in Hive
      await homeLocalDataSource.cacheProducts(
        categoryId,
        cachedProducts,
      );

      // 4. Return API data
      return Right(products);
    } on ServerException catch (e) {
      try {
        // 5. Get products from Hive if API fails
        final response = await homeLocalDataSource.getProducts(categoryId);

        // 6. Convert ProductHiveModel to ProductEntity
        final products = response
            .map((product) => toEntity(product))
            .toList();

        return Right(products);
      } on CachedExceptions catch (cacheError) {
        return Left(ErrorHandler.handle(cacheError));
      }
    }
  }
}
