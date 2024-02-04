import 'user.dart';

class UserModel {
  String? message;
  User? user;
  String? token;

  UserModel({this.message, this.user, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );
}
