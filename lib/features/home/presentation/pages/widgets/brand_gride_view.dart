import 'package:e_commerce/features/home/presentation/manager/home_category_cubit/home_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/brand_gide_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsGrideView extends StatelessWidget {
  const BrandsGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCategoryAndBrandsCubit,
        HomeCategoryAndBrandsStatesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCategoryAndBrandsCubit.get(context);
        return GridView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 13,
            crossAxisCount: 2,
          ),
          itemCount: cubit.brandsListData.length,
          itemBuilder: (context, i) {
            return BrandsGrideViewItem(
              image: cubit.brandsListData[i].imageUrl,
            );
          },
        );
      },
    );
  }
}
