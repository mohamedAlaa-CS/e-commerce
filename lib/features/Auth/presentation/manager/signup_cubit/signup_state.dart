part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserModel model;

  SignupSuccess({required this.model});
}

final class SignupFailuer extends SignupState {
  final String errorMessage;

  SignupFailuer({required this.errorMessage});
}
