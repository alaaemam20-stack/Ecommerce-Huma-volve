import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_data_source_interface.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

class DatailsDataSourceImp  implements DetailsDataSourceInterface{
    final ApiClient apiClient;

  DatailsDataSourceImp(this.apiClient);

  @override
  Future<ProductModel> getProductById(int productId) async {
    final response = await apiClient.dio.get(
      '${ApiEndpoints.productsEndpoint}/$productId',
    );

    return ProductModel.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}