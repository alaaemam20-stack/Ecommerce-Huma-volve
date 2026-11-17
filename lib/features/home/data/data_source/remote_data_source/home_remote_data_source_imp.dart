import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/error/exception.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImp(this.apiClient);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await apiClient.dio.get(ApiEndpoints.categoriesEndpoint);

      final List<dynamic> jsonData = response.data as List<dynamic>;

      return jsonData.map((item) {
        return CategoryModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } on DioException catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<List<ProductModel>> getProducts(
    int categoryId, {
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await apiClient.dio.get(
        '${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}',
        queryParameters: {"limit": limit, "offset": offset},
      );

      final List<dynamic> jsonData = response.data as List<dynamic>;

      return jsonData.map((item) {
        return ProductModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } on DioException catch (e) {
      throw ServerException(e);
    }
  }
}
