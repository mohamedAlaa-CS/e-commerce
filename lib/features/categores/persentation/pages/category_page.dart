import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/network_info/network_info.dart';
import 'package:e_commerce/core/widgets/app_text_form.dart';
import 'package:e_commerce/features/categores/persentation/widgets/categorySelectAndUnselectItem.dart';
import 'package:e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:e_commerce/features/home/data/models/categories.model.dart';
import 'package:e_commerce/features/home/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/categories_use_case.dart';
import 'package:e_commerce/features/home/presentation/manager/home_category_cubit/home_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../home/data/data_source/home_local_data_source.dart';
import '../../../home/data/repos/Home_repo_impel.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    this.list,
  });
  final List<CategoriesModel>? list;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selecCategory = -1;
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
                    child: BlocProvider(
                      create: (context) => HomeCategoryAndBrandsCubit(
                        CategoriesUseCase(
                          homeRepo: HomeRepoImpel(
                            homeRemoteDataSource: HomeRemoteDataSourceImpel(),
                            homeLocalDataSorce: HomeLocalDataSourceImpel(),
                            networkInfo: NetworkInfoImpl(
                              internetConnectionChecker:
                                  InternetConnectionChecker(),
                            ),
                          ),
                        ),
                        BrandsUseCase(
                          homeRepo: HomeRepoImpel(
                            homeRemoteDataSource: HomeRemoteDataSourceImpel(),
                            homeLocalDataSorce: HomeLocalDataSourceImpel(),
                            networkInfo: NetworkInfoImpl(
                              internetConnectionChecker:
                                  InternetConnectionChecker(),
                            ),
                          ),
                        ),
                      )..getCategory(),
                      child: BlocConsumer<HomeCategoryAndBrandsCubit,
                              HomeCategoryAndBrandsStatesState>(
                          builder: (context, state) {
                            var categoriesCubit =
                                HomeCategoryAndBrandsCubit.get(context);
                            return Container(
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
                                itemCount:
                                    categoriesCubit.categoriesList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selecCategory = index;
                                      });
                                    },
                                    child: CategorySelectAndUnselectItem(
                                      text: categoriesCubit
                                          .categoriesList[index].title,
                                      select: selecCategory == index,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          listener: (context, state) {}),
                    ),
                  ),
                  7.wSize,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('hello Alaa'),
                        7.hSize,
                        Image.asset(
                          AppStrings.baner_1,
                        ),
                        10.hSize,
                        Expanded(
                          child: GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1 / 1.3,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        AppStrings.baner_1,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  7.hSize,
                                  const Text('hello'),
                                ],
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
  }
}
