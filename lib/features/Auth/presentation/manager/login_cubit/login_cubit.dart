import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  final formKey = GlobalKey<FormState>(debugLabel: 'LoginForm');

  tryLogin() {
    if (formKey.currentState!.validate()) {
      return login();
    }
  }

  final AuthRepo authRepo;
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  UserModel? userModel;
  login() async {
    emit(LoginLoding());
    var result =
        await authRepo.userLogin(email: email.text, passWord: passWord.text);
    result.fold((failuer) {
      emit(LoginFailuer());
    }, (usermodel) {
      userModel = usermodel;
      emit(LoginSuccess());
    });
  }
}
