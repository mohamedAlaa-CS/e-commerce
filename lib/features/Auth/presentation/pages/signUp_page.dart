import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/extensions/context_size.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_buttom.dart';
import 'package:flutter/material.dart';
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
        child: SingleChildScrollView(
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
              const MainTextField(
                title: 'Full Name',
                hintText: 'enter your full name',
              ),
              18.hSize,
              const MainTextField(
                title: 'Mobile Number',
                hintText: 'enter your mobile no.',
              ),
              18.hSize,
              const MainTextField(
                title: 'E-mail address',
                hintText: 'enter your email address',
              ),
              18.hSize,
              const MainTextField(
                title: 'Password',
                hintText: 'enter your password',
              ),
              18.hSize,
              const MainTextField(
                title: ' confirm Password',
                hintText: 'enter your password',
              ),
              24.hSize,
              MainButtom(
                text: 'Sign up',
                onPressed: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
