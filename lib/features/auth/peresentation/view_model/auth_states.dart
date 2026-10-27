
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entity/signup_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  final LoginEntity loginEntity;

  AuthLoginSuccessState(this.loginEntity);
}

class AuthLoginErrorState extends AuthState {
  final String errorMessage;

  AuthLoginErrorState(this.errorMessage);
}

class AuthSignupLoadingState extends AuthState {}

class AuthSignupSuccessState extends AuthState {
  final SignupEntity signupEntity;

  AuthSignupSuccessState(this.signupEntity);
}

class AuthSignupErrorState extends AuthState {
  final String errorMessage;

  AuthSignupErrorState(this.errorMessage);
}
