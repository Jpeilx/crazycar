
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/router/app_router.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: getRegularStyle(fontSize: FontSize.s13, color: AppColors.kDarkPrimaryColor, fontFamily: FontConstants.poppinsFontfamily),
          ),
          TextSpan(
            text: ' Login',
            style: getSemiBoldStyle(fontSize: FontSize.s13, color: AppColors.kPrimaryColor, fontFamily: FontConstants.poppinsFontfamily),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(AppRouter.kLoginView) ;
              },
          ),
        ],
      ),
    );
  }
}