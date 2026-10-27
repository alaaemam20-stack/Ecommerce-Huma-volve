import 'package:ecommerce_app_huma_volve/features/auth/data/models/login_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_response_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';

abstract class AuthDataSourceInterface {
  Future<LoginModel> login(String email, String password);
  Future<SignupResponseModel> signUp(SignupRequestModel requestModel);
}
