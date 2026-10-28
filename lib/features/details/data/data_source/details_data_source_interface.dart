import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

abstract class DetailsDataSourceInterface {
   Future<ProductModel> getProductById(int productId);
}