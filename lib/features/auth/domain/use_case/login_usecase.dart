import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repo/auth_repo_interface.dart';

class LoginUsecase {
  final AuthRepoInterface authRepoInterface;
  LoginUsecase({required this.authRepoInterface});
  Future<Either<Failure, LoginEntity>> invoke(String email, String password) =>
      authRepoInterface.login(email, password);
}
