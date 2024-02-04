import 'package:e_commerce/features/Auth/data/models/user_model/user_model.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  UserModel? userModel;
  login({required String email, required String passWord}) async {
    emit(LoginLoding());
    var result = await authRepo.userLogin(email: email, passWord: passWord);
    result.fold((failuer) {
      emit(LoginFailuer());
    }, (usermodel) {
      userModel = usermodel;
      emit(LoginSuccess());
    });
  }
}
