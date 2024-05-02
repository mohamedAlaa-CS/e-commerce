import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:flutter/material.dart';

class GrideViewItem extends StatelessWidget {
  const GrideViewItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppStrings.baner_1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        7.hSize,
        Expanded(
          flex: 1,
          child: Text(
            name,
            //cubit.subCategoryList[index].name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
