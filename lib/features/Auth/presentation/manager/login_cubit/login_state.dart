part of 'login_cubit.dart';

@immutable
sealed class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoding extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final UserModel model;

  LoginSuccess({required this.model});
}

final class LoginFailuer extends LoginStates {}

final class LoginChangeVisabilityPasswordState extends LoginStates {}
