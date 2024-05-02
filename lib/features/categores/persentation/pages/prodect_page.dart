import 'dart:developer';

import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/features/categores/data/repos/product_repo_imple.dart';
import 'package:e_commerce/features/categores/persentation/manager/product_cubit/product_cubit.dart';
import 'package:e_commerce/features/categores/persentation/widgets/product_grid_view_item.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.subCategoryId});
  final String subCategoryId;

  @override
  Widget build(BuildContext context) {
    log(subCategoryId);
    return BlocProvider(
      create: (context) =>
          ProductCubit(ProductRepoImple())..getProducts(subCategoryId),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1 / 1.2,
                        ),
                        itemBuilder: (context, index) => ProductItemWidget(
                          image: cubit.allProductsList[index].images?[0],
                          title: cubit.allProductsList[index].title ?? '',
                          price: cubit.allProductsList[index].price.toString(),
                          oldPrice:
                              cubit.allProductsList[index].quantity.toString(),
                          onTap: () {},
                          des: cubit.allProductsList[index].description ?? '',
                          review: cubit.allProductsList[index].ratingsAverage
                              .toString(),
                        ),
                        itemCount: cubit.allProductsList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
