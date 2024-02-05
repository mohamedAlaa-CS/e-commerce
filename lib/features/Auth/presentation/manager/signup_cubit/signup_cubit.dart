import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController poassWord = TextEditingController();
  TextEditingController rePoassWord = TextEditingController();
  var formKey = GlobalKey<FormState>(debugLabel: 'signup');

  static SignupCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  signupUser() async {
    emit(SignupLoading());
    var result = await authRepo.userSignup(
      name: name.text,
      phone: phone.text,
      email: email.text,
      poassWord: poassWord.text,
      rePoassWord: rePoassWord.text,
    );
    result.fold((failuer) {
      emit(SignupFailuer(errorMessage: failuer.message));
    }, (userModel) {
      emit(SignupSuccess(model: userModel));
    });
  }
}
