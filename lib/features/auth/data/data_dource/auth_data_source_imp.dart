import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/data_dource/auth_data_source_interface.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/login_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';

class AuthDataSourceImp implements AuthDataSourceInterface {
  final ApiClient apiClient;
  AuthDataSourceImp({required this.apiClient});
  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.loginEndpoint,
      data: {"email": email, "password": password},
    );
    final Map<String, dynamic> jsondata = response.data;
    final modelData = LoginModel.fromJson(jsondata);
    return modelData;
  }

  @override
  Future<SignupResponseModel> signUp(SignupRequestModel requestModel) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.signupEndpoint,
      data: {
        "name": requestModel.name,
        "email": requestModel.email,
        "password": requestModel.password,
        "avatar": "https://picsum.photos/seed/picsum/200/300",
      },
    );
    final jsonData = response.data;
    final dartData = SignupResponseModel.fromJson(jsonData);
    return dartData;
  }
}
