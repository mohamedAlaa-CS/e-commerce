import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/extensions/context_size.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:flutter/material.dart';

class CategoryGrideViewItem extends StatelessWidget {
  const CategoryGrideViewItem(
      {super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(image),
        ),
        2.hSize,
        SizedBox(
            width: context.width / 4.9,
            child: Text(
              text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
                overflow: TextOverflow.ellipsis,
              ),
            ))
      ],
    );
  }
}
