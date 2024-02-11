import 'package:e_commerce/features/home/presentation/pages/widgets/brand_gide_view_item.dart';
import 'package:flutter/material.dart';

class BrandsGrideView extends StatelessWidget {
  const BrandsGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 13,
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, i) {
        return const BrandsGrideViewItem(
          image:
              'https://res.cloudinary.com/dwp0imlbj/image/upload/v1680747186/Route-Academy-brands/1678286824747.png',
        );
      },
    );
  }
}
