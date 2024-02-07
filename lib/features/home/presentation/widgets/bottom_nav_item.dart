import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem bootomNAvItem(
    {required bool select, required String image}) {
  return BottomNavigationBarItem(
    icon: Container(
        alignment: Alignment.center,
        padding: 13.aEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: select ? AppColors.white : AppColors.main,
          // borderRadius: 100.cBorder,
        ),
        child: SvgPicture.asset(
          image,
          color: select ? AppColors.main : AppColors.white,
        )),
    label: '',
  );
}
