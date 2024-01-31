
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: getRegularStyle(fontSize: FontSize.s11, color: AppColors.kGreyColor, fontFamily: ''),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: getMediumStyle(fontSize: FontSize.s13, color: AppColors.kDarkPrimaryColor, fontFamily:'') ,
          ),
          TextSpan(
            text: ' and',
            style: getRegularStyle(fontSize: FontSize.s13, color: AppColors.kGreyColor, fontFamily: '').copyWith(height: 1.5), 
           
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: getMediumStyle(fontSize: FontSize.s13, color: AppColors.kDarkPrimaryColor, fontFamily:'') ,
          ),
        ],
      ),
    );
  }
}
