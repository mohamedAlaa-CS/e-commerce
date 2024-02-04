import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:flutter/material.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppStrings.logo,
                height: 100,
                color: AppColors.white,
              ),
              30.hSize,
              const MainTextField(
                title: 'User Name',
                hintText: 'enter your name',
              ),
              18.hSize,
              const MainTextField(
                title: 'Password',
                hintText: 'enter your password',
                suffixIcon: Icons.visibility,
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
            ],
          ),
        ),
      ),
    );
  }
}
