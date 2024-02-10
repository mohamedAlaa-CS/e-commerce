import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppStrings.logo,
              height: 30,
              color: AppColors.main,
            ),
            20.hSize,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MainTextField(
                    hintText: 'what do you search for?',
                    prefixIcon: Icons.search,
                    fillColor: Colors.transparent,
                    border: searchBorder(),
                    focusedBorder: searchBorder(),
                    enabledBorder: searchBorder(),
                  ),
                ),
                20.wSize,
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppStrings.cartIcon,
                    height: 30,
                  ),
                ),
                20.wSize
              ],
            )
          ],
        ),
      ),
    );
  }
}

InputBorder searchBorder() {
  return OutlineInputBorder(
    borderRadius: 50.cBorder,
    borderSide: const BorderSide(
      color: AppColors.main,
      width: 0.5,
    ),
  );
}
