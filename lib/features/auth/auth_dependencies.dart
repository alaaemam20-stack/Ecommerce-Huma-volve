import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';

import '../../features/auth/data/data_dource/auth_data_source_imp.dart';
import '../../features/auth/data/repo/auth_repo_imp.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';
import '../../features/auth/domain/use_case/signup_usecase.dart';
import '../../features/auth/peresentation/view_model/auth_cubit.dart';

AuthCubit createAuthCubit() {
  final apiClient = ApiClient();

  final authDataSource = AuthDataSourceImp(apiClient: apiClient);

  final authRepo = AuthRepoImp(authDataSourceInterface: authDataSource);

  final loginUseCase = LoginUsecase(authRepoInterface: authRepo);

  final signupUseCase = SignupUsecase(authRepoInterface: authRepo);

  return AuthCubit(loginUseCase: loginUseCase, signupUseCase: signupUseCase);
}
