import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/models/signup_resquest_model.dart';

class SignupService {
  ApiClient apiClient;
  SignupService(this.apiClient);

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
