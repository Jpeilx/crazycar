

import 'package:crazycar/core/utils/colors/app_colors.dart';
import 'package:crazycar/core/shared/widgets/app_container_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAddImageWidget extends StatelessWidget {
  final Function()? onTap;
  final double sizeIcon;

  const ItemAddImageWidget({
    Key? key,
    required this.onTap,
    this.sizeIcon = 44,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColors.kWhite2Color,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: MyContainerShape(
          enableShadow: false,
          enableBorder: true,
          bgContainer: AppColors.kTansparentColor,
          topEndRaduis: 10,
          bottomEndRaduis: 10,
          bottomStartRaduis: 10,
          topStartRaduis: 10,
          child: Stack(children: [
            Center(
              child: Icon(
                Icons.add,
                color: AppColors.kGrey1Color ,
                size: sizeIcon.r,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
