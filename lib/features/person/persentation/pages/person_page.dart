import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // logo image ............................................................
            SvgPicture.asset(
              AppStrings.logo,
              height: 30,
              color: AppColors.main,
            ),
            20.hSize,
            // intro text in person page ..............................................
            const Text(
              'Welcome, Mohamed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'mohamed.N@gmail.com',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            20.hSize,
            MainTextField(
              title: 'Your full name',
              titleColor: AppColors.textColor,
              suffixWidget: SvgPicture.asset(
                AppStrings.editIcon,
                height: 5,
                width: 5,
              ),
              hintText: 'Mohamed Mohamed Nabil',
            ),
            10.hSize,
            MainTextField(
              title: 'Your E-mail',
              titleColor: AppColors.textColor,
              suffixWidget: SvgPicture.asset(
                AppStrings.editIcon,
                height: 5,
                width: 5,
              ),
              hintText: 'Mohamed Mohamed Nabil',
            ),
            10.hSize,
            MainTextField(
              title: 'Your password',
              titleColor: AppColors.textColor,
              suffixWidget: SvgPicture.asset(
                AppStrings.editIcon,
                height: 5,
                width: 5,
              ),
              hintText: 'Mohamed Mohamed Nabil',
            ),
            10.hSize,
            MainTextField(
              title: 'Your mobile number',
              titleColor: AppColors.textColor,
              suffixWidget: SvgPicture.asset(
                AppStrings.editIcon,
                height: 5,
                width: 5,
              ),
              hintText: 'Mohamed Mohamed Nabil',
            ),
            10.hSize,
            MainTextField(
              title: 'Your Address',
              titleColor: AppColors.textColor,
              suffixWidget: SvgPicture.asset(
                AppStrings.editIcon,
                height: 5,
                width: 5,
              ),
              hintText: 'Mohamed Mohamed Nabil',
            ),
            10.hSize,
          ],
        ),
      ),
    );
  }
}
