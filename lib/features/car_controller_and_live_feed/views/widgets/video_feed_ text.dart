import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoFeedText extends StatelessWidget {
  const VideoFeedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.redDotForLiveImage,
          width: 25.w,
          height: 25.h,
          fit: BoxFit.contain,
        ),
        horizontalSpace(10),
        Text(
          'Live Feed',
          style: getMediumStyle(
              fontSize: FontSize.s28,
              color: AppColors.kBlackColor,
              fontFamily: FontConstants.poppinsFontfamily),
        )
      ],
    );
  }
}
