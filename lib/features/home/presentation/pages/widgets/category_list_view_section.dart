import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/category_grid_view_item.dart';
import 'package:flutter/material.dart';

class CategoryListViewSection extends StatelessWidget {
  const CategoryListViewSection(
      {super.key, required this.categoryList, required this.onTapItem});
  final List<CategoryEntity> categoryList;
  final VoidCallback onTapItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => 8.wSize,
          itemCount: categoryList.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: onTapItem,
                child: CategoryGrideViewItem(
                  image: categoryList[index].imageUrl,
                  text: categoryList[index].title,
                ),
              )),
    );
  }
}
