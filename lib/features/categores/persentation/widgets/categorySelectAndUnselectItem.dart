import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:flutter/material.dart';

class CategorySelectAndUnselectItem extends StatelessWidget {
  const CategorySelectAndUnselectItem(
      {super.key, required this.text, required this.select});
  final String text;
  final bool select;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10),
        color: select ? AppColors.white : AppColors.backGroundContainerColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (select) ...{
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              10.wSize,
            },
            Container(
              constraints: const BoxConstraints(
                maxWidth: 103,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
