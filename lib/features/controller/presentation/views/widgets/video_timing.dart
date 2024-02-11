import 'package:crazycar/core/constant/app_assets.dart';
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/utils/styles/font_manager.dart';
import 'package:crazycar/core/utils/styles/text_style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoTiming extends StatelessWidget {
  const VideoTiming({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(30),
        Image.asset(
          AssetsData.redDotForLiveImage ,
          width: 30.w,
          height: 30.h,
          fit: BoxFit.contain,
        ),
        horizontalSpace(10),
        Text('00:00:00' , style: getMediumStyle(fontSize: FontSize.s28, color: AppColors.kGreyColor, fontFamily: FontConstants.poppinsFontfamily),)

      ],
    );
  }
}