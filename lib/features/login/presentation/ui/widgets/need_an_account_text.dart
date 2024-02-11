
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';

class NeedAnAccountText extends StatelessWidget {
  const NeedAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Need to buy our car ?',
            style: getRegularStyle(fontSize: FontSize.s13, color: AppColors.kDarkPrimaryColor, fontFamily: ''),
          ),
          TextSpan(
            text: ' Buy now',
            style:getSemiBoldStyle(fontSize: FontSize.s13 , color: AppColors.kPrimaryColor, fontFamily: ''),
          ),
        ],
      ),
    );
  }
}
