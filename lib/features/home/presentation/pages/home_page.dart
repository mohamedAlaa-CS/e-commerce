import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/category_grid_view_item.dart';
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
            ),
            15.hSize,
            Image.asset(AppStrings.baner_1),
            10.hSize,
            const Row(
              children: [
                MainText.heading('Categories'),
                Spacer(),
                MainText.body('view all')
              ],
            ),
            10.hSize,
            SizedBox(
              height: 136,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => 8.wSize,
                  itemCount: 10,
                  itemBuilder: (context, index) => const CategoryGrideViewItem(
                        image:
                            'https://fanbooster.com/wp-content/uploads/2020/02/SocialMediaImageSizes2020.jpg',
                        text: 'Headphones ',
                      )),
            ),
            SizedBox(
              height: 130,
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => 8.wSize,
                  itemCount: 10,
                  itemBuilder: (context, index) => const CategoryGrideViewItem(
                        image:
                            'https://fanbooster.com/wp-content/uploads/2020/02/SocialMediaImageSizes2020.jpg',
                        text: 'Headphones ',
                      )),
            ),
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
