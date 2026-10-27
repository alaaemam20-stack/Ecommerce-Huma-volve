import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repo/auth_repo_interface.dart';

class SignupUsecase {
  final AuthRepoInterface authRepoInterface;

  SignupUsecase({required this.authRepoInterface});
  Future<Either<Failure,SignupEntity>> invoke(SignupRequestModel requestModel) =>
      authRepoInterface.signUp(requestModel);
}
