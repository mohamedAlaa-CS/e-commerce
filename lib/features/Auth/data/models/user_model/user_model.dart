import 'user.dart';

class UserModel {
  String? message;
  String? error;
  User? user;
  String? token;

  UserModel({this.message, this.user, this.token, this.error});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] == 'success' ? json['message'] : null,
        error: json.containsKey('errors')
            ? json['errors']['msg']
            : json.containsKey('statusMsg')
                ? json['message']
                : null,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );
}
