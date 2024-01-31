import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:crazycar/core/utils/styles/values_manager.dart';
import 'package:flutter/material.dart';


ThemeData getApplicationTheme() {
  return ThemeData(

      // main colors
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      primaryColor: AppColors.kPrimaryColor,
      primaryColorLight: AppColors.kGreyColor,
      primaryColorDark: AppColors.kDarkPrimaryColor,
      disabledColor: AppColors.kGreyColor,
      scaffoldBackgroundColor: AppColors.kLightPrimaryColor,
      canvasColor: AppColors.kWhiteColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      useMaterial3: true,
      cardTheme: const CardTheme(
          color: AppColors.kWhiteColor,
          shadowColor: AppColors.kWhiteColor,
          elevation: AppSize.s0),
      // app bar theme
      navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.kPrimaryColor),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.kPrimaryColor,
          elevation: AppSize.s4,
          shadowColor: AppColors.kLightPrimaryColor,
          titleTextStyle:
              //To Do
              getSemiBoldStyle(
                  fontSize: FontSize.s16,
                  color: AppColors.kBlackColor,
                  fontFamily: "")),
      // button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: AppColors.kDarkPrimaryColor,
          buttonColor: AppColors.kDarkPrimaryColor,
          splashColor: AppColors.kLightPrimaryColor),

      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: AppColors.kBlackColor,
                  fontSize: FontSize.s17,
                  fontFamily: ""),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          headlineLarge: getSemiBoldStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          headlineMedium: getRegularStyle(
              color: AppColors.kDarkGreyColor,
              fontSize: FontSize.s14,
              fontFamily: ""),
          titleMedium: getMediumStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          titleSmall: getRegularStyle(
              color: AppColors.kWhiteColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          bodyLarge: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          bodySmall: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s16,
              fontFamily: ""),
          bodyMedium: getRegularStyle(
              color: AppColors.kGreyColor,
              fontSize: FontSize.s12,
              fontFamily: ""),
          labelSmall: getBoldStyle(
              color: AppColors.kPrimaryColor,
              fontSize: FontSize.s12,
              fontFamily: '')),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(

          // content padding

          contentPadding: const EdgeInsets.all(AppPadding.p8),

          // hint style
          hintStyle: getRegularStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: ""),
          labelStyle: getMediumStyle(
              color: AppColors.klightGreyColor,
              fontSize: FontSize.s14,
              fontFamily: ""),
          errorStyle: getRegularStyle(
              color: AppColors.kRedColor,
              fontSize: FontSize.s14,
              fontFamily: ""),

          // enabled border style
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: AppSize.s2),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // focused border style
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: AppSize.s2),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

          // error border style
          errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.kRedColor, width: AppSize.s2),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s5))),
          // focused border style
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kGreyInputborderColor, width: AppSize.s2),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)))),
      // label style
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: AppColors.kWhiteColor));
}
