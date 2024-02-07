import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/features/categores/persentation/pages/category_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/home/presentation/widgets/bottom_nav_item.dart';
import 'package:e_commerce/features/loves/persentation/pages/loves_page.dart';
import 'package:e_commerce/features/person/persentation/pages/person_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> screenList = [
    const HomePage(),
    const CategoryPage(),
    const LovePage(),
    const PersonPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.main,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: [
              bootomNAvItem(
                  image: AppStrings.homeIcon, select: currentIndex == 0),
              bootomNAvItem(
                  image: AppStrings.categoryIcon, select: currentIndex == 1),
              bootomNAvItem(
                  image: AppStrings.loveIcon, select: currentIndex == 2),
              bootomNAvItem(
                  image: AppStrings.personIcon, select: currentIndex == 3),
            ]),
      ),
    );
  }
}
