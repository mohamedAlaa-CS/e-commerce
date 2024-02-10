import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/home/presentation/manager/main_cubit/main_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          body: cubit.screenList[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeCurrentIndex(value);
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.main,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                items: [
                  bootomNAvItem(
                      image: AppStrings.homeIcon,
                      select: cubit.currentIndex == 0),
                  bootomNAvItem(
                      image: AppStrings.categoryIcon,
                      select: cubit.currentIndex == 1),
                  bootomNAvItem(
                      image: AppStrings.loveIcon,
                      select: cubit.currentIndex == 2),
                  bootomNAvItem(
                      image: AppStrings.personIcon,
                      select: cubit.currentIndex == 3),
                ]),
          ),
        );
      },
    );
  }
}
