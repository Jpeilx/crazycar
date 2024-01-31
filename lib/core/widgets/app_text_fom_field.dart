import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  late TextEditingController? controller;
  final TextInputType? keyboardtype;
  void Function(String)? onsubbmited;
  Function(String)? onchanged;
  String? Function(String?)? validator;
  Widget? prefix;
  String? label;
  void Function()? ontap;
  bool password = false;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final TextStyle? hintStyle;

  AppTextFormField(
      {super.key,
      required this.controller,
      required this.keyboardtype,
      this.onsubbmited,
      this.onchanged,
      this.validator,
      this.prefix,
      this.label,
      this.ontap,
      this.password = false,
     this.suffixIcon ,
      this.contentPadding,
      this.focusedBorder ,
      this.enabledBorder,
      this.backgroundColor,
      this.hintStyle,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.kBlackColor,
      style: getRegularStyle(
          fontSize: FontSize.s14, color: AppColors.kBlackColor, fontFamily: ""),
      obscureText: password,
      keyboardType: keyboardtype,
      onFieldSubmitted: onsubbmited,
      onChanged: onchanged,
      onTap: ontap,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.kBlackColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.klightGreyColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        hintText: label,
        hintStyle: getRegularStyle(
            fontSize: FontSize.s14,
            color: AppColors.klightGreyColor,
            fontFamily: ""),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: prefix,
        ),
        suffixIcon: suffixIcon ,
        border: const OutlineInputBorder(),
        fillColor: backgroundColor ?? AppColors.kWhiteColor,
        filled: true,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
