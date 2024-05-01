import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/features/categores/persentation/widgets/product_grid_view_item.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
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
              // product grid view ................................................
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) => ProductItemWidget(
                    image:
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                    title: 'Nike Air Jordon',
                    price: ' 1,200 ',
                    oldPrice: '2000',
                    onTap: () {},
                    des: 'Nike shoes flexible for wo..',
                    review: '4.6',
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
