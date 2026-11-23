import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/data_dource/auth_data_source_interface.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/signup_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:ecommerce_app_huma_volve/core/storage/secure_storage.dart';
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface authDataSourceInterface;
  AuthRepoImp({required this.authDataSourceInterface});
  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password) async{
    try {final response = await authDataSourceInterface.login(email, password);

      await SecureStorage.saveAccessToken(response.accessToken ?? '');

      if (response.refreshToken != null &&
          response.refreshToken!.isNotEmpty) {
        await SecureStorage.saveRefreshToken(response.refreshToken!);
      }
    return Right(response.toEntity());
    } catch (e) {
      return Left(Failure(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupEntity>> signUp(
    SignupRequestModel requestModel,
  ) async {
    try {
      final response = await authDataSourceInterface.signUp(requestModel);
      return Right(response.toEntity());
    } catch (e) {
      return Left(Failure(failureMessage: e.toString()));
    }
  }
}
