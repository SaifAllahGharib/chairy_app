import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity user;

  AuthSuccessState(this.user);
}

class AuthFailureState extends AuthState {
  final Failure failure;

  AuthFailureState(this.failure);
}

class AuthShowPasswordState extends AuthState {}

class AuthErrorFieldState extends AuthState {}

class AuthChangeStepState extends AuthState {}

class AuthChangeViewState extends AuthState {}
