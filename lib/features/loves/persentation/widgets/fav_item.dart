import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/helper/utilities/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavItem extends StatelessWidget {
  const FavItem({
    super.key,
    required this.productImge,
    required this.productTitle,
    required this.productColor,
    required this.productSalary,
    required this.productSalaryBeforeDis,
    required this.addTocard,
    required this.productColorText,
  });
  final String productImge;
  final String productTitle;
  final String productColorText;
  final Color productColor;
  final String productSalary;
  final String productSalaryBeforeDis;
  final VoidCallback addTocard;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 8.cBorder,
        border: Border.all(width: 1, color: AppColors.main),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image in fav item .......................................
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1 / 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  productImge,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          10.wSize,
          // fav item details widget ......................................
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                // title and fva icon .........................
                Row(
                  children: [
                    Text(
                      productTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        padding: 3.aEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppStrings.loveIcon,
                            color: AppColors.main,
                            height: 18,
                            width: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.hSize,
                // color fav item ...................................................
                Row(children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: productColor,
                    ),
                  ),
                  7.wSize,
                  Text(
                    productColorText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ]),
                10.hSize,
                // salary and add to card button ............................................
                Row(
                  children: [
                    Text('EGP $productSalary'),
                    7.wSize,
                    // salary before ......
                    Text(
                      'EGP $productSalaryBeforeDis',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(width: 5),
                    ),
                    // add to card button ......
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: addTocard,
                        child: Container(
                          padding: 7.aEdge,
                          decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'add to card',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
