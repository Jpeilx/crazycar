
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/utils/helper/spacing.dart';
import 'package:crazycar/core/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserTrackingImageNavBAr extends StatelessWidget {
  final String title1;
  final String title2;

  final Function()? onPressedPrevious;
  final Function()? onPressedNext;

  const AddUserTrackingImageNavBAr({
    Key? key,
    this.onPressedNext,
    this.onPressedPrevious,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: Row(
        children: [
          Expanded(
            child: AppElevatedButton(
              fontSize: 18,
              title: title1,
               titleColor: AppColors.kblueColor,
              background: AppColors.kWhiteColor,
              
              onPressed: onPressedPrevious,
            ),
          ),
         horizontalSpace(23) ,
          Expanded(
            child: AppElevatedButton(
              
              background: AppColors.kblueColor,
              fontSize: 18,
              title: title2,
              onPressed: onPressedNext,
            ),
          ),
        ],
      ),
    ));
  }
}
