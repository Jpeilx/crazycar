
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NeedAnAccountText extends StatelessWidget {
  const NeedAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: getRegularStyle(fontSize: FontSize.s13, color: AppColors.kDarkPrimaryColor, fontFamily: ''),
          ),
          TextSpan(
            text: ' Register Now',
            style:getSemiBoldStyle(fontSize: FontSize.s13 , color: AppColors.kPrimaryColor, fontFamily: ''),
             recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(AppRouter.kRegisterView) ;
              },
          ),
        ],
      ),
    );
  }
}
