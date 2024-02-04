import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/extensions/context_size.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/helper/utilities/app_validator.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_buttom.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo_impel.dart';
import 'package:e_commerce/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
        child: Padding(
          padding: 14.aEdge,
          child: BlocProvider(
            create: (context) => LoginCubit(AuthRepoImpel()),
            child: BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = LoginCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height / 10),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppStrings.logo,
                            height: 100,
                            color: AppColors.white,
                          ),
                        ),
                        30.hSize,
                        const MainText.textButton(
                          'Welcome Back To Route',
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                        const MainText(
                          'Please sign in with your mail',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        15.hSize,
                        MainTextField(
                          validator: AppValidator.emailValidate,
                          controller: cubit.email,
                          title: 'User Name',
                          hintText: 'enter your name',
                        ),
                        18.hSize,
                        MainTextField(
                          validator: AppValidator.passwordValidate,
                          controller: cubit.passWord,
                          title: 'Password',
                          hintText: 'enter your password',
                          suffixIcon: cubit.suffix,
                          isobscure: cubit.isPassword,
                          suffixPressed: () {
                            cubit.changeVisablityPassword();
                          },
                        ),
                        10.hSize,
                        const Align(
                          alignment: Alignment.centerRight,
                          child: MainText.title(
                            'Forgot password',
                            color: AppColors.white,
                          ),
                        ),
                        40.hSize,
                        MainButtom(
                          text: 'Login',
                          onPressed: () {
                            cubit.tryLogin();
                          },
                        ),
                        10.hSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const MainText.title(
                              'Please sign in with your mail ?',
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
