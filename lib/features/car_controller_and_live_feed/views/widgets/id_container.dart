
import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdContainer extends StatelessWidget {
  final String number;
  final bool trackedUser;

  const IdContainer(
      {super.key, required this.number, this.trackedUser = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 45.w,
      decoration: BoxDecoration(
        color: trackedUser
            ? AppColors.kPrimaryColor
            : AppColors.kWhiteColor, // Background color
        borderRadius: BorderRadius.circular(10), // Border radius
        border: Border.all(color: AppColors.kPrimaryColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset:const  Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color:
                trackedUser ? AppColors.kWhiteColor : AppColors.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.5),
                offset: const  Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
