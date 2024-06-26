import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/network_info/network_info.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:e_commerce/features/home/data/data_source/home_local_data_source.dart';
import 'package:e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo_impel.dart';
import 'package:e_commerce/features/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/features/home/presentation/manager/home_category_cubit/home_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/brand_gride_view.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/category_list_view_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCategoryAndBrandsCubit(
        CategoriesUseCase(
          homeRepo: HomeRepoImpel(
            homeRemoteDataSource: HomeRemoteDataSourceImpel(),
            homeLocalDataSorce: HomeLocalDataSourceImpel(),
            networkInfo: NetworkInfoImpl(
              internetConnectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        BrandsUseCase(
          homeRepo: HomeRepoImpel(
            homeRemoteDataSource: HomeRemoteDataSourceImpel(),
            homeLocalDataSorce: HomeLocalDataSourceImpel(),
            networkInfo: NetworkInfoImpl(
              internetConnectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
      )
        ..getCategory()
        ..getBrands(),
      child: BlocConsumer<HomeCategoryAndBrandsCubit,
          HomeCategoryAndBrandsStatesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var categoriesCubit = HomeCategoryAndBrandsCubit.get(context);
          var mainCubit = MainCubit.get(context);

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
                      height: 250,
                      child: CategoryListViewSection(
                        categoryClicked: () {
                          mainCubit.changeCurrentIndex(1);
                        },
                        categoryList: categoriesCubit.categoriesList,
                      ),
                    ),
                    const MainText.heading('Brands'),
                    5.hSize,
                    const SizedBox(height: 200, child: BrandsGrideView()),
                    10.hSize,
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
