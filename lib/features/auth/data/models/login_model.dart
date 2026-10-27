import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/login_entity.dart';

class LoginModel {
  String? accessToken;
  String? refreshToken;

  LoginModel({this.accessToken, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

 
  LoginEntity toEntity() {
  return LoginEntity(
    accessToken: accessToken??"",
    refreshToken: refreshToken??"",
  );
}
}

