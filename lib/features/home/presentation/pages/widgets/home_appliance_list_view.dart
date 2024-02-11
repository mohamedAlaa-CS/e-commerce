import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/home_appliance_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeApplianceListView extends StatelessWidget {
  const HomeApplianceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeAppllianceListViewItem(
          image:
              'https://fanbooster.com/wp-content/uploads/2020/02/SocialMediaImageSizes2020.jpg',
          price: 200.toString(),
          review: 4.5.toString(),
          title: 'Headphones',
          ontap: () {},
        ),
        separatorBuilder: (context, index) => 8.wSize,
        itemCount: 10,
      ),
    );
  }
}
