import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/signup_entity.dart';

class SignupResponseModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  SignupResponseModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  SignupEntity toEntity() {
    return SignupEntity(
      id: id ?? 0,
      email: email ?? "",
      password: password ?? "",
      name: name ?? "",
      role: role ?? "",
      avatar: avatar ?? "",
      creationAt: creationAt ?? "",
      updatedAt: updatedAt ?? "",
    );
  }
  
}