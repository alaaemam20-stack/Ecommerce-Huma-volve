import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/use_case/login_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/use_case/signup_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_resquest_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/peresentation/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUseCase;
  final SignupUsecase signupUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signupUseCase,
  }) : super(AuthInitialState());

  Future<void> login(String email, String password) async {
    emit(AuthLoginLoadingState());

    final result = await loginUseCase.invoke(email, password);

    result.fold(
      (failure) {
        emit(AuthLoginErrorState(failure.failureMessage));
      },
      (loginEntity) {
        emit(AuthLoginSuccessState(loginEntity));
      },
    );
  }

  Future<void> signUp(SignupRequestModel requestModel) async {
    emit(AuthSignupLoadingState());

    final result = await signupUseCase.invoke(requestModel);

    result.fold(
      (failure) {
        emit(AuthSignupErrorState(failure.failureMessage));
      },
      (signupEntity) {
        emit(AuthSignupSuccessState(signupEntity));
      },
    );
  }
}