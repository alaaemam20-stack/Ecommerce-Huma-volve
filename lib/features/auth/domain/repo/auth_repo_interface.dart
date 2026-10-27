import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/signup_entity.dart';

abstract class AuthRepoInterface {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
  Future<Either<Failure, SignupEntity>> signUp(SignupRequestModel requestModel);
}
