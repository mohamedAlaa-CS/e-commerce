import 'package:e_commerce/features/categores/persentation/pages/category_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/loves/persentation/pages/loves_page.dart';
import 'package:e_commerce/features/person/persentation/pages/person_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  changeCurrentIndex(int value) {
    emit(MainInitial());
    currentIndex = value;
    emit(ChangeNavBar());
  }

  List<Widget> screenList = [
    const HomePage(),
    CategoryPage(),
    const LovePage(),
    const PersonPage()
  ];

  // List<BottomNavigationBarItem> bottomNavList = [
  //   bootomNAvItem(image: AppStrings.homeIcon, select: currentIndex == 0),
  //   bootomNAvItem(image: AppStrings.categoryIcon, select: currentIndex == 1),
  //   bootomNAvItem(image: AppStrings.loveIcon, select: currentIndex == 2),
  //   bootomNAvItem(image: AppStrings.personIcon, select: currentIndex == 3),
  // ];
}
