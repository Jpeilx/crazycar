import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';

class RepeatedFunctions {
  static showSnackBar(
    BuildContext context, {
    required String message,
    Color? textColor,
    Color? background,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: getMediumStyle(
              fontSize: FontSize.s14,
              color: AppColors.kWhiteColor,
              fontFamily: FontConstants.poppinsFontfamily),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
}
