import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/extensions/context_size.dart';
import 'package:e_commerce/core/helper/functions/show_snack_bar.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/helper/utilities/app_validator.dart';
import 'package:e_commerce/core/helper/utilities/local_data.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_buttom.dart';
import 'package:e_commerce/features/Auth/data/repos/auth_repo_impel.dart';
import 'package:e_commerce/features/Auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: SafeArea(
          child: Padding(
        padding: 14.aEdge,
        child: BlocProvider(
          create: (context) => SignupCubit(AuthRepoImpel()),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                showSnackBar(
                  context,
                  message: state.model.message ?? state.model.error ?? '',
                  error: state.model.error != null,
                );
                LocalData.saveToken(
                  state.model.token ?? '',
                );
              }
              if (state is SignupFailuer) {
                showSnackBar(context, message: state.errorMessage, error: true);
              }
            },
            builder: (context, state) {
              var cubit = SignupCubit.get(context);
              return SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height / 12),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppStrings.logo,
                          height: 100,
                          color: AppColors.white,
                        ),
                      ),
                      30.hSize,
                      MainTextField(
                        controller: cubit.name,
                        validator: AppValidator.nameValidate,
                        title: 'Full Name',
                        hintText: 'enter your full name',
                      ),
                      18.hSize,
                      MainTextField(
                        textType: TextInputType.number,
                        controller: cubit.phone,
                        validator: AppValidator.phoneValidate,
                        title: 'Mobile Number',
                        hintText: 'enter your mobile no.',
                      ),
                      18.hSize,
                      MainTextField(
                        controller: cubit.email,
                        validator: AppValidator.emailValidate,
                        title: 'E-mail address',
                        hintText: 'enter your email address',
                      ),
                      18.hSize,
                      MainTextField(
                        controller: cubit.poassWord,
                        validator: AppValidator.passwordValidate,
                        title: 'Password',
                        hintText: 'enter your password',
                        suffixIcon: cubit.suffix,
                        isobscure: cubit.isPassword,
                        suffixPressed: () {
                          cubit.changeVisablityPassword();
                        },
                      ),
                      18.hSize,
                      MainTextField(
                        controller: cubit.rePoassWord,
                        validator: AppValidator.passwordValidate,
                        title: ' confirm Password',
                        hintText: 'enter your password',
                        suffixIcon: cubit.suffix,
                        isobscure: cubit.isPassword,
                        suffixPressed: () {
                          cubit.changeVisablityPassword();
                        },
                      ),
                      24.hSize,
                      ConditionalBuilder(
                        condition: state is SignupLoading,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                        fallback: (context) => MainButtom(
                          text: 'Sign up',
                          onPressed: () {
                            cubit.trySignup();
                          },
                        ),
                      ),
                      10.hSize,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
