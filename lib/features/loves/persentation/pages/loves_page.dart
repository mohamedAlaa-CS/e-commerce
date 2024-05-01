import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/loves/persentation/widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            // search bar ............................................................
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                // card icon ...........................................
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppStrings.cartIcon,
                    height: 30,
                  ),
                ),
                20.wSize
              ],
            ),
            10.hSize,
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return 10.hSize;
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return FavItem(
                      productImge: AppStrings.baner_1,
                      productTitle: 'Nike Air Jorden',
                      productColor: AppColors.black,
                      productColorText: 'Black color',
                      productSalary: '1,200',
                      productSalaryBeforeDis: '1,200',
                      addTocard: () {},
                    );
                  }),
            ),
            10.hSize,
          ],
        ),
      ),
    );
  }
}
