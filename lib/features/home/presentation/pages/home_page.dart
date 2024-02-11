import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:e_commerce/features/home/data/data_source/home_local_data_source.dart';
import 'package:e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo_impel.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/features/home/presentation/manager/home_category_cubit/home_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/category_grid_view_item.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/home_appliance_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCategoryCubit(
        CategoriesUseCase(
          homeRepo: HomeRepoImpel(
            homeRemoteDataSource: HomeRemoteDataSourceImpel(),
            homeLocalDataSorce: HomeLocalDataSourceImpel(),
          ),
        ),
      )..getCategory(),
      child: BlocConsumer<HomeCategoryCubit, HomeCategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var categoriesCubit = HomeCategoryCubit.get(context);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: SingleChildScrollView(
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
                    Row(
                      children: [
                        const MainText.heading('Categories'),
                        const Spacer(),
                        const MainText.body('view all'),
                        10.wSize,
                      ],
                    ),
                    10.hSize,
                    SizedBox(
                      height: 146,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => 8.wSize,
                          itemCount: categoriesCubit.categoriesList_1.length,
                          itemBuilder: (context, index) =>
                              CategoryGrideViewItem(
                                image: categoriesCubit
                                    .categoriesList_1[index].imageUrl,
                                text: categoriesCubit
                                    .categoriesList_1[index].title,
                              )),
                    ),
                    SizedBox(
                      height: 146,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => 8.wSize,
                        itemCount: categoriesCubit.categoriesList_2.length,
                        itemBuilder: (context, index) => CategoryGrideViewItem(
                          image:
                              categoriesCubit.categoriesList_2[index].imageUrl,
                          text: categoriesCubit.categoriesList_2[index].title,
                        ),
                      ),
                    ),
                    const MainText.heading('Home Appliance'),
                    5.hSize,
                    const HomeApplianceListView(),
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

InputBorder searchBorder() {
  return OutlineInputBorder(
    borderRadius: 50.cBorder,
    borderSide: const BorderSide(
      color: AppColors.main,
      width: 0.5,
    ),
  );
}
