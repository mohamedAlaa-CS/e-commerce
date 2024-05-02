import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_routes.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/features/categores/data/repos/category_repo_imple.dart';
import 'package:e_commerce/features/categores/persentation/manager/category_cubit/category_cubit.dart';
import 'package:e_commerce/features/categores/persentation/pages/prodect_page.dart';
import 'package:e_commerce/features/categores/persentation/widgets/categorySelectAndUnselectItem.dart';
import 'package:e_commerce/features/categores/persentation/widgets/grid_view_item_category.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryRepoImpl())..getCategory(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);

          //String subCategoryId = cubit.categoryList[selecCategory].id ?? '';

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

                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 200,
                            decoration: const BoxDecoration(
                              color: AppColors.backGroundContainerColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              border: Border(
                                left: BorderSide(
                                  //                   <--- left side
                                  color: AppColors.main,
                                  width: 1.0,
                                ),
                                top: BorderSide(
                                  //                    <--- top side
                                  color: AppColors.main,
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  //                    <--- top side
                                  color: AppColors.main,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: cubit.categoryList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await cubit.cahngeSelectIndex(index);
                                    await cubit.getSubCategory();
                                  },
                                  child: CategorySelectAndUnselectItem(
                                    text: cubit.categoryList[index].title,
                                    select: cubit.selectIndex == index,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        7.wSize,
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.categoryTitle ?? ''),
                              7.hSize,
                              Image.asset(
                                AppStrings.baner_1,
                              ),
                              10.hSize,
                              Expanded(
                                child: state is SubCategoryLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : GridView.builder(
                                        itemCount: cubit.subCategoryList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 1 / 1.3,
                                        ),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              AppRoutes.routeTo(
                                                  context, const ProductPage());
                                            },
                                            child: GrideViewItem(
                                              name: cubit.subCategoryList[index]
                                                      .name ??
                                                  '',
                                            ),
                                          );
                                        },
                                      ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
