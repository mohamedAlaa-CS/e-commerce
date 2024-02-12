import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:flutter/material.dart';

class BrandsGrideViewItem extends StatelessWidget {
  const BrandsGrideViewItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      margin: 1.aEdge,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.white,
        ),
        padding: 10.aEdge,
        child: CachedNetworkImage(imageUrl: image),
      ),
    );
  }
}
