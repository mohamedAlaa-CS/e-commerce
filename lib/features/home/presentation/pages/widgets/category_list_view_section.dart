import 'package:e_commerce/features/home/domain/entity/categort_entity.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/category_grid_view_item.dart';
import 'package:flutter/material.dart';

class CategoryListViewSection extends StatelessWidget {
  const CategoryListViewSection({
    super.key,
    required this.categoryList,
  });
  final List<CategoryEntity> categoryList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: EdgeInsets.zero,
      itemCount: categoryList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          //  print('categoryList[index] >>>> ${categoryList[index].Id}');
        },
        child: CategoryGrideViewItem(
          image: categoryList[index].imageUrl,
          text: categoryList[index].title,
        ),
      ),
    );
  }
}
