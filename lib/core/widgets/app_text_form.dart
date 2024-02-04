import 'package:e_commerce/core/helper/extensions/assetss_widgets.dart';
import 'package:e_commerce/core/helper/utilities/app_color.dart';
import 'package:e_commerce/core/widgets/main_text.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.contentPading,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.hintStyle,
    this.fillColor,
    this.suffixIcon,
    this.isobscure,
    this.hintText,
    this.controller,
    this.validator,
    this.suffixPressed,
    this.textType,
    this.title,
  });
  final EdgeInsetsGeometry? contentPading;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final IconData? suffixIcon;
  final bool? isobscure;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final VoidCallback? suffixPressed;
  final TextInputType? textType;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          MainText.title(
            title!,
            color: AppColors.white,
          ),
        18.hSize,
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          //style: Styles.font16W300.copyWith(color: Colors.black),
          validator: validator ,
          controller: controller,
          obscureText: isobscure ?? false,
          obscuringCharacter: '*',
          keyboardType: textType,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
                fontSize: 11, height: 1, fontWeight: FontWeight.bold),
            suffixIcon: InkWell(
              onTap: suffixPressed ?? () {},
              child: Icon(suffixIcon, color: Colors.grey.shade600),
            ),
            hintText: hintText,
            //  hintStyle: hintStyle ?? Styles.font16W300,
            fillColor: fillColor ?? AppColors.white,
            filled: true,
            contentPadding: contentPading ??
                const EdgeInsets.only(top: 18, left: 16, bottom: 17),
            border: border ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: 0.25,
                  ),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: .25,
                  ),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: 12.cBorder,
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                    width: .25,
                  ),
                ),
            errorBorder: OutlineInputBorder(
              //gapPadding: 0,
              borderRadius: 12.cBorder,
              borderSide: const BorderSide(
                color: Colors.red,
                width: .25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
