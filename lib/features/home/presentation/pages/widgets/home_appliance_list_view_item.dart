import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppllianceListViewItem extends StatelessWidget {
  const HomeAppllianceListViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.review,
      required this.price,
      this.ontap});
  final String image;
  final String title;
  final String review;
  final String price;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      decoration: BoxDecoration(
          borderRadius: 12.cBorder,
          color: AppColors.white,
          border: Border.all(color: AppColors.grey, width: .25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: InkWell(
                  onTap: ontap ?? () {},
                  child: Container(
                    padding: 5.aEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: SvgPicture.asset(
                      AppStrings.loveIcon,
                      color: AppColors.main,
                    ),
                  ),
                ),
              )
            ],
          ),
          5.hSize,
          Container(
            padding: 10.aEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText.heading(title),
                Row(
                  children: [
                    MainText.body('Review ($review)'),
                    20.wSize,
                    const Icon(
                      Icons.star,
                      color: Color(0xffFDD835),
                    )
                  ],
                ),
                8.hSize,
                Row(
                  children: [
                    MainText.body('EGP $price'),
                    const Spacer(),
                    Container(
                      padding: 6.aEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.main,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
