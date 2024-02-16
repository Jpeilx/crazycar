import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      primaryColor: AppColors.kPrimaryColor,
      primaryColorLight: AppColors.kGreyColor,
      disabledColor: AppColors.kGreyColor,
      scaffoldBackgroundColor: AppColors.kWhiteColor,
      canvasColor: AppColors.kWhiteColor,
      highlightColor: Colors.transparent,
      useMaterial3: true,
  


      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: AppColors.kBlackColor,
                  fontSize: FontSize.s17,
                  fontFamily: FontConstants.poppinsFontfamily),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)))),
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          headlineLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          headlineMedium: getRegularStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.poppinsFontfamily),
          titleMedium: getMediumStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          titleSmall: getRegularStyle(
              color: AppColors.kWhiteColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          bodyLarge: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          bodySmall: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s16,
              fontFamily: FontConstants.poppinsFontfamily),
          bodyMedium: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s12,
              fontFamily: FontConstants.poppinsFontfamily),
          labelSmall: getBoldStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s12,
              fontFamily: FontConstants.poppinsFontfamily)),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(

          // content padding

          contentPadding: const EdgeInsets.all(8),

          // hint style
          hintStyle: getRegularStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.poppinsFontfamily),
          labelStyle: getMediumStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.poppinsFontfamily),
          errorStyle: getRegularStyle(
              color: AppColors.kRedColor,
              fontSize: FontSize.s14,
              fontFamily: FontConstants.poppinsFontfamily),

          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kRedColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(5.r))))
          ,
      // label style
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.kWhiteColor));
}
